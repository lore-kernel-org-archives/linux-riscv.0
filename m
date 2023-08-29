Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1703CC83F14
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQKYF0HFnmxZRdM5ODh46tTpAlGgvf2oXM7byw7Qrik=; b=CSFgrt2b01pGnj
	8fJmQGhOYSiEmngdmc+Fz99owUsHsuXhsPO+KRhRWnU3FvqaKNHlJhoLdYdmNKp/Tv8kxb47rsE+R
	OKlhcrfu2/uNAXCZiWG1jnFZYr98J0RT5fJVMjRN/vBozFzdnIcaSSPBg1w/Mk/5uw0YGaCbqnaLR
	RJlu+1w3buoPcHXjn0WuLUrRXJyKko6gEW8xIkVaHeYhfkifJksz39uiT5Sha2Ko1lsipkqOjm97E
	SjkNapz1uQwOPYb0IOp8vCoius5j3Ytcez1GruUoVKPie2RRlXOJsUYGPPxyH+V5SWpMzIY+DdkBc
	JDCa7s4yyZwgCCejxqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qatvo-00B1JV-1l;
	Tue, 29 Aug 2023 08:18:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qatvl-00B1Ix-31
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 08:18:35 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52a3ec08d93so5375792a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693297112; x=1693901912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YzI1T+2NbKPa+ILrlCcTyXygxu+/4IOX+GwCCixXUy8=;
        b=NYqm+ES5G3BCmnDsMWFKt/TeHhfHzrc6N0RlaHKeosp2s3hMJvNTvhSuZLHZinQ3vz
         yyKfWl956ojMfRGxDPM8DrrHDUL/kggaWV09Xp20KzHpVoc+SHYxdipH+Yj2qG1TYadW
         B/HpKKdxxqKY4eo2sGjjYJwdpUe/SU4PcjPT6EkfeP0YIiXJiIHI00uQmG3wj/9T20bG
         Hfg5gMSaPLgoqmEGl72HQ/Cy1jdgdnZmRfcdywC+eyX9f+U91irMD1QbMTljUBbqcZ8I
         bkw83L0Z8SGXFoMEqhAkNmAQydx1VaqngfwyUn0m2NslBQNVNLN+/KaruZorZCfH6znq
         +BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693297112; x=1693901912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzI1T+2NbKPa+ILrlCcTyXygxu+/4IOX+GwCCixXUy8=;
        b=RhZq51sRNJfZg97WIIqpE5qMN7UiGeKGtF7xSiBXMW99xNsAgPW3RanMXYPTZd2s7m
         G7utYE9Q16E/VbSAk0eaw9MZT5lvZ/W4RZHaetLo32nvHmB3TgYJ0LWTM9j+5KA3BXoA
         9VkOJMrmMHcVGjO+3E5YJLUquFMarYLtIAhWExONN9/xoDmrF2I6WakwS4VvWlUBpKya
         yNdUTyfMeuFj2w0mY+8FFMTA+Xx4No4mK5UUFpq3k7r/PyrXJqVGgCb/teovl+topRTh
         xag0PpUqb2Do8EdxpXfBBP4lT7Un4MSyhUpYgWWSygmn2ZO7ubWuWBBf97Hqjngpsa9V
         3omQ==
X-Gm-Message-State: AOJu0Yz7s/OqToKGhkx/ChqsdOYll5wWph2yodveUlFmZbwgGJMbpyZL
	Ej7g1wjoFacuVJLiVgYdNyw=
X-Google-Smtp-Source: AGHT+IE3mRfIvKXbHtpMoS5M4OQ2ByoT6MjDiGZeA537rzrccA/PlIFgswGlCI+WiS/AtJ9r8K2W1A==
X-Received: by 2002:a17:906:3193:b0:9a2:256a:65cd with SMTP id 19-20020a170906319300b009a2256a65cdmr10288792ejy.4.1693297112147;
        Tue, 29 Aug 2023 01:18:32 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906590b00b00992e14af9b9sm5643992ejq.134.2023.08.29.01.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:18:31 -0700 (PDT)
Date: Tue, 29 Aug 2023 10:18:30 +0200
From: Nam Cao <namcaov@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@kernel.org
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
Message-ID: <ZO2p1tScBT1UFMh1@nam-dell>
References: <20230827205641.46836-1-namcaov@gmail.com>
 <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
 <20230829-unbridle-condense-2fc45a442bb6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-unbridle-condense-2fc45a442bb6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_011833_975296_34C3C70C 
X-CRM114-Status: GOOD (  29.01  )
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
cyBDX0VCUkVBSz8gVGhhdCBzYWlkLCB0aGlzIHNob3VsZCBiZSB1c2luZyBJU19FTkFCTEVEKCkg
bm90Cj4gI2lmZGVmLCBzaW5jZSB0aGUgZGVmaW5pdGlvbiBmb3IgcmlzY3ZfaW5zbl9pc19jX2Vi
cmVhaygpIGlzIHByb3ZpZGVkCj4gdW5jb25kaXRpb25hbGx5IGFmYWljdC4KClNvcnJ5LCB3YXMg
dG9vIHF1aWNrIHRoYXQgSSBtaXNzZWQgdGhlIGxhc3Qgc2VudGVuY2UuCgpOb3cgSSdtIG5vdCBz
dXJlIHdoYXQgeW91IG1lYW4uIEJ1dCBJIGFncmVlIHdpdGggR3VvIFJlbiBoZXJlLCB1c2VycyBj
YW4gdXNlCmNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25zIGJ1dCBrZXJuZWwgZG9lcyBub3QgaGF2ZSBp
dCBlbmFibGVkLiBTbyB3ZSBzaG91bGQKYWx3YXlzIGNoZWNrIGMuZWJyZWFrIHJlZ2FyZGxlc3Mg
b2YgUklTQ1ZfSVNBX0MuCgpCZXN0IHJlZ2FyZHMsCk5hbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
