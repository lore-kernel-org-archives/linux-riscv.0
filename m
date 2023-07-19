Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD974C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozExWPqhIX6lG/Fyt4yNe46NC88ilads1G0Kwr1nJZQ=; b=G7svD7Gv7r8kgV
	NxmcjuC0hzQO02uHQ3gRhPRQoX1r6k7EClF2RgRscRLHvRL2G/3aqU0G3GuXsfCdraxVnkWs8mzGv
	34gn8QOSQ5uj6/wGZHMGIBVDnsWTFnCLl9wnLbeVJtT1R/HTA4NRmI8Kz8IGYXy5ep086k3aFBQio
	dB4anT05+fPSyIrULnNb7XVV8OGPSSM6v3pQuqqmy6W+PXNUslUSNCLIhclbQtCxc44aCKed0gk9D
	cuwIuIiHdvNs06pl3FRC5aDqprK9Ojlb0SvMJBvxq0Xsaq90sYiq5mJQroadJQQGMt7vBWvuqkwvY
	0UcIE4X+4MNl84f4sWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMExr-008znK-2d;
	Wed, 19 Jul 2023 21:44:07 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMExn-008zm5-1F
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 21:44:06 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-55ba5bb0bf3so123322a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 14:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689803042; x=1690407842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLihZVHK3CHWRwQZuJeTGZhqi1m+X+Vl21f6YoEXJhU=;
        b=G+UVUHjmkfa1/Iq+zmyB9mjg/dn+9znCrn3YV7v6AEvEH+6Isw/fYyMRfwBN4MUI9Q
         DMCmhTAWA/tndSpWKNBcbeZMoBrNHbq6I3Y3SFxZ9TYnR/cTXsJarADgWG0v7CRKS7MT
         86Aa+F3bx7QHwdi8/mOfbWJ8clXA/zEh7PS70c2+vslzfCv4seQtPy2JfNUKwX/NLT4H
         jVohrDUeK3eAUzHcA9lJF9MxyrR7fTQ3gwziLV7TVEKi/1JmTNU382je2ILO8L5Q7bSN
         lL+vgfvPWDhd3TzvnIyZ4op+0rhSr8CvxX5PlJ+lv5r7Zob2M3hINsgcszb97jAz+39Z
         gVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689803042; x=1690407842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLihZVHK3CHWRwQZuJeTGZhqi1m+X+Vl21f6YoEXJhU=;
        b=T5W7DcHUcXmqos7RmYMtI3SVtqZ2aoOo+l/Ia0MwaY4wYDpLNGc+JqwWmm+rbT4JYm
         qCiGl8xxLowzlcvn3jY7VD62RSVnl+WU7ZK+4aVFam45G/drh1aG8k47SWQOaQ864S1j
         RDUG/oESVoPaSDkJQtGYVdwxy3v9mUgveiPDJxa4A0ZWjAPQ56yZ+2N3f+VhZ4ALjr+w
         8QCxsHNs8CPMsmL64qlbQGhH6yPV2bRaOX1/FaQAcxYSFbq9pIqZAJJsFE2+yhBSsp+l
         VmqqsFZhgSFj66XWs0UXD550gNyMGT2S7wuavfez1BRVwqkGoyCOOiqd2fgZL2VvbXG3
         9/Wg==
X-Gm-Message-State: ABy/qLbPtZyn6brW+K2j0OG5BkKm2oBMi86k3RNNCmEKt1UTik08lZXV
	dsCJ9J7u0ZVQ9BBX2DOrOkIjcFVvrEzFY3VMAybgAw==
X-Google-Smtp-Source: APBJJlGLY/JCFHLpqHxC1oKpUPyJvF7kYQiXWEFjX323i/90V6LtxLIpabl9qDoFSu4vgV6EadlDAQCk73/N3FIeTak=
X-Received: by 2002:a17:90a:8c4:b0:263:f521:da3e with SMTP id
 4-20020a17090a08c400b00263f521da3emr4431779pjn.2.1689803042099; Wed, 19 Jul
 2023 14:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <20230719-confront-grass-6d0eb304b94f@spud>
In-Reply-To: <20230719-confront-grass-6d0eb304b94f@spud>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 19 Jul 2023 14:43:51 -0700
Message-ID: <CAH2o1u5pZQ6iKThFLgnn+_BBZ=j8fu91URYYxwWbfVt3OyerAA@mail.gmail.com>
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu support.
To: Conor Dooley <conor@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_144403_450984_71770DBB 
X-CRM114-Status: GOOD (  22.21  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgMTo1MOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXkgVG9tYXN6LAo+Cj4gT24gV2VkLCBKdWwgMTksIDIwMjMg
YXQgMTI6MzM6NDVQTSAtMDcwMCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiBUaGUgcGF0Y2gg
aW50cm9kdWNlcyBza2VsZXRvbiBJT01NVSBkZXZpY2UgZHJpdmVyIGltcGxlbWVudGF0aW9uIGFz
IGRlZmluZWQKPgo+IFRoaXMgY29tbWl0IG1lc3NhZ2UgcmVhZHMgbGlrZSBhIGNvdmVyIGxldHRl
ciBJTU8uIEF0IHdoYXRldmVyIHBvaW50Cj4geW91IHNlbmQgYSB2MiwgY291bGQgeW91IHJlLXdy
aXRlIHRoaXMgZm9jdXNpbmcgb24gd2hhdCBpcyBkb25lIGluIHRoZQo+IHBhdGNoIGl0c2VsZj8K
PgoKYWNrLiB3aWxsIGFtZW5kIHRoZSBjb21taXQgbWVzc2FnZS4KCgo+IEFsc28sIHNpbmNlIEkg
YW0gbm90IGdvaW5nIHRvIHJlcGx5IHRvIGFueSBvZiB0aGVzZSBpb21tdSBkcml2ZXIgcGF0Y2hl
cwo+IGluIGEgbWVhbmluZ2Z1bCBjYXBhY2l0eSwgcGxlYXNlIHJ1biBjaGVja3BhdGNoLnBsIG9u
IHlvdXIgd29yay4gVGhlcmUKPiBhcmUgd2VsbCBvdmVyIDEwMCBzdHlsZSBldGMgY29tcGxhaW50
cyB0aGF0IGl0IGhhcyBoaWdobGlnaHRlZC4gU3BhcnNlCj4gaGFzIGFsc28gZ29uZSBhIGJpdCBu
dXRzLCB3aXRoIG1hbnkgd2FybmluZ3MgYWxvbmcgdGhlIGxpbmVzIG9mOgo+IGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUuYzoxNTY4OjI5OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3Np
Z25tZW50IChkaWZmZXJlbnQgYmFzZSB0eXBlcykKPiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmM6MTU2ODoyOTogICAgZXhwZWN0ZWQgdW5zaWduZWQgbG9uZyBsb25nIFt1c2VydHlwZV0gaW9o
Z2F0cAo+IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYzoxNTY4OjI5OiAgICBnb3QgcmVzdHJp
Y3RlZCBfX2xlNjQgW3VzZXJ0eXBlXQo+Cj4gSSBjYW4gcHJvdmlkZSB5b3UgdGhlIGZ1bGwgbGlz
dCB3aGVuIHRoZSBwYXRjaHdvcmsgYXV0b21hdGlvbiBoYXMgcnVuCj4gdGhyb3VnaCB0aGUgc2Vy
aWVzLgo+CgpUaGFuayB5b3UsIGEgbGlzdCBvZiB1c2VkIGxpbnQgY2hlY2tlcnMgZGVmaW5pdGVs
eSB3b3VsZCBoZWxwLgoKCj4gQW55d2F5LCB3aGF0IEkgd2FudGVkIHRvIGFzayB3YXMgd2hldGhl
ciBpdCB3YXMgdmFsaWQgdG8gdXNlIHRoZSBJT01NVQo+IGluIGEgc3lzdGVtIGlmIFppb21tdSBp
cyBub3QgcHJlc2VudCBpbiB3aGF0ZXZlciB0aGUgSVNBIGV4dGVuc2lvbgo+IGNvbW11bmljYXRp
b24gbWVjaGFuaXNtIGlzPyBFZywgcmlzY3YsaXNhIG9yIHRoZSBJU0Egc3RyaW5nIHByb3BlcnR5
IGluCj4gdGhlIEFDUEkgdGFibGVzLgo+CgpZZXMsIHRoaXMgaGFzIGJlZW4gcG9pbnRlZCBvdXQg
dG8gbWUgYWxyZWFkeS4gQXMgZmFyIGFzIEkgY2FuIHJlY2FsbCwKdGhlcmUgd2FzIGEgZGlzY3Vz
c2lvbgphdCBzb21lIHBvaW50IHRvIGludHJvZHVjZSB0aG9zZSBhcyBaaW9tbXUgZXh0ZW5zaW9u
cywgbGF0ZXIgYWdyZWVpbmcKbm90IHRvIGNhbGwgSU9NTVUKdXNpbmcgSVNBIHN0cmluZyBjb252
ZW50aW9ucy4gIFdpbGwgcmVtb3ZlIHJlbWFpbmluZyBvY2N1cnJlbmNlcyBvZgpaaW9tbXUgZnJv
bSB0aGUgc2VyaWVzLgoKCj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4gPiBSZWZlcmVuY2VzOgo+ID4g
IC0gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWlvbW11Cj4gPiAg
LSBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3RqZXpuYWNoL2xpbnV4L3RyZWUvdGplem5hY2gvcmlz
Y3YtaW9tbXUKPiA+ICAtIFszXSBodHRwczovL2dpdGh1Yi5jb20vdGplem5hY2gvcWVtdS90cmVl
L3RqZXpuYWNoL3Jpc2N2LWlvbW11Cj4KPiBGWUksIHdlIGhhdmUgdGhlIExpbms6IHRhZy90cmFp
bGVyIGZvciB0aGlzLgo+CgoKVGhhbmtzLAotIFRvbWFzegoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
