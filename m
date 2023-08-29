Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C0DC83F14
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOvIBlxf2aNjbToCTs5aKPAxvQVXRF941CvhKeQ/vMs=; b=U2txO4eZ8Y3a9D
	y6WUeOlmo7DeF0h2bO2DR4HjhyoMKzu7ndNvhrP6wk96DW1K65HKggW8fQov+a7qmMpTbK0zMN/bR
	4cDWlVFzFYfL9bzumkB7YlB3Kdt7slTax3VRJEMyeuzDGU4GuhI4hVL+dqWx1wqG+LMOgeKJ8Mzef
	DLlofZyWcHE80LNiTLHCphY/EAa7I1ZjPyEEjBulKAoIVW0CcgKBPADdIOZqnSP7Z7FIVX2n7WqRB
	ilaQ2Gq33m6JBuuxsLsLglK9W2MHXGdmWd3kiLoPkORK9DaxtM/WIOeKeRatgJxfO5SF2eSwxFihC
	U0AkhyGCVUCCGvXIGNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatq1-00B0ra-07;
	Tue, 29 Aug 2023 08:12:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qatpy-00B0r1-1L
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 08:12:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99de884ad25so544990066b.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693296750; x=1693901550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUBkOkSn+fNpGKbpzoAsa+XXVS4RDDY3/CCAT4NKkbc=;
        b=kmpXEXRscSEfs8/aucVTnvjrPlKskVkA6tKp60RdaHdfC7KfgnQWzGySl92MPtrftq
         4cTG2V+e/bpNAqL7Qpm1QJRjM5u2hKbYzJJ2pihgP6EnXQVm6E5OcmcM83f23IVWSR2J
         Sm4ubvbLpl0JHbcoCViklc8IjQmFkCCCbJWrAiby3E7HX53eehHW8Wvv8uigFBBpijI7
         v6pitK6q1XWWC5jXHH4r3/gIe/a8w0cE3E8ZsTfKvgu03Wo5hG1SVkKRR1zRBiVpX6y+
         j2B16xN51j7E88O7JfB90ypICR9KNWrdGwsUvWuWW81waPt/oSy7DVMcSRDNaWC8/FL9
         O/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693296750; x=1693901550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUBkOkSn+fNpGKbpzoAsa+XXVS4RDDY3/CCAT4NKkbc=;
        b=HlLQ8v6DImifGwk+GCnGJjFm0UCit9WKZiYi87PqKY4sV34pfsoAHeEw2znt+9IXMS
         3kpnDznNarzNhuM/Ewy/EQSTOtXUVsiZUTPMiQHzbMaVIATgBfTCqFohG1Sy7TDccaYh
         Ed6DgFVpHzGgtFaPEbxW350e/iIzXcE0Xwq5EEEPbNqsTG1Se4kryLmbTrujIHeFGEKA
         Pp06ZZ7NhxbcAsMjx2/wyULyQfwHjnL0poAFnc0p4wbr96JC4CZb+k1KCS2uQ4LZ8gaW
         rNIjy7EzJiDnHiSuqbdThaAsNRbdodCLm8RJmOoS0NGBPkbxYRLQ9YnYopoH6ZpuIKl9
         pnCQ==
X-Gm-Message-State: AOJu0YyFhN4Lhb6pu1fSqkGasXCmgFoAVjMwhFpts+L8pB8VWhVAWUT1
	/pmwgc0zioyw08OFJJnTG68=
X-Google-Smtp-Source: AGHT+IH1P3iU+c+MfeDSKphQ/LNuOLt5BV0h6BGz1lW6rAJrEULK+IouT/ZMobUfiO5Fto9u4sZNIA==
X-Received: by 2002:a17:906:3182:b0:9a5:d095:a8e3 with SMTP id 2-20020a170906318200b009a5d095a8e3mr538678ejy.13.1693296749919;
        Tue, 29 Aug 2023 01:12:29 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906044800b009a57d30df89sm5339400eja.132.2023.08.29.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:12:29 -0700 (PDT)
Date: Tue, 29 Aug 2023 10:12:28 +0200
From: Nam Cao <namcaov@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <ZO2obGvrqWsl1VvY@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
 <20230829-unbridle-condense-2fc45a442bb6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-unbridle-condense-2fc45a442bb6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_011234_458791_2FA258A2 
X-CRM114-Status: GOOD (  25.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDc6MjY6NTRBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFR1ZSwgQXVnIDI5LCAyMDIzIGF0IDAxOjU2OjM0UE0gKzA4MDAsIEd1byBSZW4g
d3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyAyOCwgMjAyMyBhdCA0OjU24oCvQU0gTmFtIENhbyA8bmFt
Y2FvdkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiB1cHJvYmVzIGV4cGVjdHMgaXNfdHJh
cF9pbnNuKCkgdG8gcmV0dXJuIHRydWUgZm9yIGFueSB0cmFwIGluc3RydWN0aW9ucywKPiA+ID4g
bm90IGp1c3QgdGhlIG9uZSB1c2VkIGZvciBpbnN0YWxsaW5nIHVwcm9iZS4gVGhlIGN1cnJlbnQg
ZGVmYXVsdAo+ID4gPiBpbXBsZW1lbnRhdGlvbiBvbmx5IHJldHVybnMgdHJ1ZSBmb3IgMTYtYml0
IGMuZWJyZWFrIGlmIEMgZXh0ZW5zaW9uIGlzCj4gPiA+IGVuYWJsZWQuIFRoaXMgY2FuIGNvbmZ1
c2UgdXByb2JlcyBpZiBhIDMyLWJpdCBlYnJlYWsgZ2VuZXJhdGVzIGEgdHJhcAo+ID4gPiBleGNl
cHRpb24gZnJvbSB1c2Vyc3BhY2U6IHVwcm9iZXMgYXNrcyBpc190cmFwX2luc24oKSB3aG8gc2F5
cyB0aGVyZSBpcyBubwo+ID4gPiB0cmFwLCBzbyB1cHJvYmVzIGFzc3VtZSBhIHByb2JlIHdhcyB0
aGVyZSBiZWZvcmUgYnV0IGhhcyBiZWVuIHJlbW92ZWQsIGFuZAo+ID4gPiByZXR1cm4gdG8gdGhl
IHRyYXAgaW5zdHJ1Y3Rpb24uIFRoaXMgY2F1c2UgYW4gaW5maW5pdGUgbG9vcCBvZiBlbnRlcmlu
Zwo+ID4gPiBhbmQgZXhpdGluZyB0cmFwIGhhbmRsZXIuCj4gPiA+Cj4gPiA+IEluc3RlYWQgb2Yg
dXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24sIGltcGxlbWVudCB0aGlzIGZ1bmN0aW9u
Cj4gPiA+IHNwZWZpY2lhbGx5IGZvciByaXNjdiB3aGljaCBjaGVja3MgZm9yIGJvdGggZWJyZWFr
IGFuZCBjLmVicmVhay4KPiA+ID4KPiA+ID4gRml4ZXM6IDc0Nzg0MDgxYWFjOCAoInJpc2N2OiBB
ZGQgdXByb2JlcyBzdXBwb3J0ZWQiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1j
YW92QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
dXByb2Jlcy5jIHwgMTAgKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy91cHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gPiA+IGlu
ZGV4IDE5NGYxNjZiMmNjNC4uOTFmNGNlMTAxY2QxIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy91cHJvYmVzLmMKPiA+ID4gQEAgLTMsNiArMyw3IEBACj4gPiA+ICAjaW5jbHVkZSA8
bGludXgvaGlnaG1lbS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3B0cmFjZS5oPgo+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L3Vwcm9iZXMuaD4KPiA+ID4gKyNpbmNsdWRlIDxhc20vaW5zbi5oPgo+
ID4gPgo+ID4gPiAgI2luY2x1ZGUgImRlY29kZS1pbnNuLmgiCj4gPiA+Cj4gPiA+IEBAIC0xNyw2
ICsxOCwxNSBAQCBib29sIGlzX3N3YnBfaW5zbih1cHJvYmVfb3Bjb2RlX3QgKmluc24pCj4gPiA+
ICAjZW5kaWYKPiA+ID4gIH0KPiA+ICA+Cj4gPiA+ICtib29sIGlzX3RyYXBfaW5zbih1cHJvYmVf
b3Bjb2RlX3QgKmluc24pCj4gPiA+ICt7Cj4gPiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9D
Cj4gCj4gPiBDYW4gd2UgcmVtb3ZlIHRoZSBDT05GSUdfUklTQ1ZfSVNBX0M/IEFzIHlvdSBzYWlk
LCAidXByb2JlcyBleHBlY3RzCj4gPiBpc190cmFwX2luc24oKSB0byByZXR1cm4gdHJ1ZSBmb3Ig
YW55IHRyYXAgaW5zdHJ1Y3Rpb25zIi4gU28gdXNlcnNwYWNlCj4gPiB3b3VsZG4ndCBiZSBsaW1p
dGVkIGJ5IENPTkZJR19SSVNDVl9JU0FfQy4KPiAKPiBJc24ndCB0aGUgUklTQ1ZfSVNBX0MgcmVx
dWlyZWQgYmVjYXVzZSB0aGVyZSdzIGEgZGlmZmVyZW50IGVuY29kaW5nIGZvcgo+IEVCUkVBSyB2
cyBDX0VCUkVBSz8KCnJpc2N2X2luc25faXNfY19lYnJlYWsoKSBjYW4gYmUgdXNlZCB3aXRob3V0
IGVuYWJsaW5nIFJJU0NWX0lTQV9DLCBzbyBubyBpdCdzCm5vdCByZXF1aXJlZC4KCkJlc3QgcmVn
YXJkcywKTmFtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
