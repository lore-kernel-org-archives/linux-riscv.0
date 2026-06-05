Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01507CD6E7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qENuuv3Fof0NjSdWPI00PVnlomIMkJI2QRTPpoIXTo=; b=iVI3DoMoDDUKvJ
	k+GNiKPe5u371APiRFkdPFkjcGweHgiiHr9UnoGQD/7sbQWoXUpvq9UUNERzHvUr9t5diYaFXP42J
	wqYT2PRaO2Qp+SuRByexjztNclx+6b0NJMUJQnQkbovUuGou8Roiorj7ey6f8wIjo4w8g+2W3WdFw
	8wcQf/PQx2GTkdyoFx7T574Vji+Q/cThWDAyFZFfqMnaOSUod1LDGkC9fpEyxOYtELW1xWyLcqVVF
	RxozNAmLjPszpkpCaHOai7xzkKtWEU/RopvCpwif7jsitFLD2/UvYqTFvTRbygw485RZCP57lNDR2
	/09rjsBWwyqLR1MjbrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVwV-00000000kvu-0d70;
	Fri, 05 Jun 2026 14:54:39 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVwS-00000000kus-2hLG
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 14:54:38 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5174a3d9598so17989451cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 07:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780671275; cv=none;
        d=google.com; s=arc-20240605;
        b=NgbdrYFeBwCyEk+DrtUl5Dn1Ao074iWXaAGyIFxsLB+bO8bNJkwI5nKxNGHW0qxs+2
         sBO0eUcgyj0m5/RB3IH1YQRrmqzdesAS1FsUq9us6XYSFKppRV0OplorSrICu3Im1sXX
         R1rQSRPs99ciwAbOiBuf6c63i2okplmQkWzEC9wiVMH+51raZhvJu+/jD8RNtmBLGOM/
         cpfsdqteDHobXFkOtMAvJ4G7/RArTEBTS/lSzXemL2ZwtClX95kAnKena86QzQ55iMZR
         Tl0kTBHU3UauVMY2URDnDoeL6AanpbGMtTglLzNVGZOJsusBBVTHECGqii3hcs4scrho
         4MOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        fh=ssoqSE8CNc/Nkgf3Hxf1eadklntMyxff28hE6P/B5ys=;
        b=ZK8jjuW7kgd3DWg1KZbDvuX2iu+t2zAaSrDfFIHGqlpG7zG3fFQpmf6l1mHi3u/W7W
         GH88jJml/hvei5/mNbq8v/HAGeHbtvfbXabQvuP0mRHiCgWGqPQrsCVDfbE1THaivr0S
         khbq4kn+2KE7I+hmw1Oc1sbPdzGw/C8U6d3JPRdjSgIbtBXigc2KQ73YNmgDLKuskHzG
         RHmPw9RsoTPmQt3iXYcgBIjW+Kt/ZrVernVDuMvefvNmEGna46dJsb5vFkBwWuTtSR5d
         34RhJcNsqtHz9iSd/mqXz6NLJqwZOgW5AE4Z4DXT1iDWkQlXpa/P1MY0anIu/SCgZDsz
         QrQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780671275; x=1781276075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        b=gHpXelhXjWTaKxMdF4SwiGMFzkOkhWEyUYdr4Cx4Q8MU4wZQYZl2USdbqn4Pf0HlQM
         2OGScdHM0tAafAcSD72pi+vZPyC307H0TlkvowMN7DYkfz+OJgB8mRKy/fP+lODlV6fw
         gWRz/HLijh+nY0AN0v9nHLcV9EEIZ1dRiH35c87b7qAIXY1uPd2JYyJb6MKD4UPmfGL3
         Y9OlDdarfVjC7u0UZxLwgmwLclGTTCa+zgWkwQqenDjqY+VsyUp6iMasYZiWvmNgchqe
         ZOWmqLwfChxEJYZaFi0kdLT/UxxdVgUCKV4HIG1OQsv/X3JeKaNt/ILIjqdEzoqeYdlh
         JW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671275; x=1781276075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QjX98Uht19FjoE2NcL+rrjlJpfTyguEM6t6ATWltAqU=;
        b=FhmOAvKUKi+qVhPH6UK1lA9Wi83RVsOQ2AeSBXVpAU8K3tM4E4dK9qqIkqiuzkQ+45
         k6iWR1d+NOioRayO9t6kV8WEo/co8onD+Y9OG7aBMd14F2hGk6Ox8eXbABI7AjfrWWR1
         fuyMpuuKUE+jPUIT16sd0NDv505Dm7lRJSwtz+xKqIqx7oFDbpa5JyD9BAfcSEUadffE
         0S2lUiSUwVes6YVcbvBdel+w+Tajuy0lhs5q41E8CowLcuUTZw0Bv13nyKRz5w0Jft/Q
         Scf86ICeCAE3rwzMeBV0d07pGGSCmSWAjcompI1D+nBiot0g2T4wPchJ21hjZCuTqdxZ
         1Ong==
X-Forwarded-Encrypted: i=1; AFNElJ/gZwNk7turAdHX4nsd0YWq07ICMtE7iKqfdJMUhXH1N0xofAPPS6jZgLQPaztYug32rVTze/GOhBxTlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwnjLnkPGFfCE9dvCRbVg9OkDseQYgM680IL+FxZlfpK1HWU8k
	e6Owv4usP5h7/Zh09lsfAlB5J5Jk6lxh826+u0f0w0q4xa1dIDLgDFeJTV+S9gPjcZ8UzVoTF3U
	+F92mXuNODyjpWO2uI4ZYGIJZP9BfOBh93/2dQgMRpA==
X-Gm-Gg: Acq92OGeKqKnSZRLlvUS87J2F7pftBSH7RHTJRad2B2UXB8G8GDWw+1OZZo3p+unBTf
	WppCs+YXHciP4xzurVWq6hCOcOtgW5nU1JbIMlk527fT/wpNqFWiGFnYK/d3JPucxsvnEN/lChU
	Ci6Z0brqsS8iI3YVq+gegjweLNdKOgkmUoCdtDChjGu3Ek8beFKGf0HdKUwrpZqExB/4l2eubM7
	UWfUf+Bw3rS2jgf0frltBn0BaUAO1+to1+PKWkcpQw6P8ie8juE/dYx/hUBcVmDguL6DmOAmp9t
	NvQjeFrnwmsB6wKnVNBSdJkghmhx/9GQuWm/dWJH7bRBU/NgejpXRV+jds++o4+3w63vDdkPPaE
	77mRyx8Jb0FZgsqbBWW0mxpwI72n3c0HINUfJPQ==
X-Received: by 2002:ac8:41cc:0:b0:517:9648:f71f with SMTP id
 d75a77b69052e-5179648fc59mr42366971cf.45.1780671275119; Fri, 05 Jun 2026
 07:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260528113840.2629186-1-inochiama@gmail.com>
In-Reply-To: <20260528113840.2629186-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 20:24:21 +0530
X-Gm-Features: AVHnY4KB369R15pBBirZiowSu3UvfNZTrfqaGWoeJbgD61ZJLwhslkozizsMbN0
Message-ID: <CAAhSdy1svqDsgNSMhawR4xJN0=LLpRv2dkTu54oc9S7BmqfVzg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_075436_935285_070ECA69 
X-CRM114-Status: GOOD (  20.45  )
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

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgNTowOOKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBlbmFibGluZyBkaXJ0eSByaW5nLCB0aGUgZGly
dHkgYml0bWFwIGlzIGRpc2FibGUsIGFuZCB0aGUgbG9nZ2luZwo+IGNoZWNrIGlzIGFsd2F5cyBm
YWxzZSBhcyB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBzZWxlY3QKPiAiTkVFRF9L
Vk1fRElSVFlfUklOR19XSVRIX0JJVE1BUCIuIEFsdGhvdWdoIHRoZSBkaXJ0eSBsb2cgaXMgcmVj
b3JkZWQKPiBzaW5jZSB0aGUgd3JpdGUgcGF0aCBhbHJlYWR5IHRyeWluZyB0byBhZGQgdGhlIGRp
cnR5IGxvZywgdGhlIGxvZ2ljIGZvcgo+IGxvZ2dpbmcgY2hlY2sgaXMgYnJva2VuIGFuZCBzb21l
IHNpZGUgZWZmZWN0IHdpbGwgb2NjdXJzLgo+Cj4gRW5oYW5jZSB0aGUgbG9nZ2luZyBjaGVjayBm
b3IgbW11IG1hcHBpbmcgc28gaXQgY2FuIGNoZWNrIGJvdGggdGhlIGRpcnR5Cj4gcmluZyBhbmQg
dGhlIGRpcnR5IGJpdG1hcC4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4yCgpUaGFua3MsCkFu
dXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOSArKysrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMmQz
ZGVmMDI0MjcwLi5iNTg3M2JjYTlkY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC0xNDIsOSArMTQyLDggQEAgdm9p
ZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGt2bV9tcl9jaGFuZ2UgY2hhbmdlKQo+ICB7
Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogQXQgdGhpcyBwb2ludCBtZW1zbG90IGhhcyBiZWVu
IGNvbW1pdHRlZCBhbmQgdGhlcmUgaXMgYW4KPiAtICAgICAgICAqIGFsbG9jYXRlZCBkaXJ0eV9i
aXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0cmFja2VkIHdoaWxlCj4gLSAgICAgICAgKiB0
aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgo+ICsgICAgICAgICogQXQgdGhpcyBw
b2ludCBtZW1zbG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgZGlydHkgcGFnZXMgd2lsbCBiZQo+
ICsgICAgICAgICogdHJhY2tlZCB3aGlsZSB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVj
dGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoY2hhbmdlICE9IEtWTV9NUl9ERUxFVEUg
JiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+
IEBAIC00MzMsOCArNDMyLDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAgICAgICAgIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+
a3ZtOwo+ICAgICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpwY2FjaGUgPSAmdmNw
dS0+YXJjaC5tbXVfcGFnZV9jYWNoZTsKPiAtICAgICAgIGJvb2wgbG9nZ2luZyA9IChtZW1zbG90
LT5kaXJ0eV9iaXRtYXAgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAhKG1lbXNsb3QtPmZs
YWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNlOwo+ICsgICAgICAgYm9vbCBs
b2dnaW5nID0ga3ZtX3Nsb3RfZGlydHlfdHJhY2tfZW5hYmxlZChtZW1zbG90KSAmJgo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIShtZW1zbG90LT5mbGFncyAmIEtWTV9NRU1fUkVBRE9OTFkpOwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyB2bWFfcGFnZXNpemUsIG1tdV9zZXE7Cj4gICAgICAgICBz
dHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAt
LQo+IDIuNTQuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
