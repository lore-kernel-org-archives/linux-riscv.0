Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9789EE88D80
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ga5BKKQaRfnuMsGFLD6jO8ZsxtZVz4L2qQEi5qaJ8s=; b=aUafqDuSRCM6a3
	12QfTmPCiyp0ixfTWeMrx0VCyXHrDf203PDvtFOfCL05Xr1R0SX/zp1bDYk4SWDU7vS9DXfgtgJHb
	MpbiVRZ+WlqNNskBor0gUhynPnuFJlS02ii+WYpW6AUx6tLRZuU4+4Aiiydgs9IzE4uPTaVGYlCO4
	yAldYaXfTk9/XECi+FVnIZ3MfU3GMVBKVZ2dJsBbd2Wn1WcKrRImQFyUoVfxpTCoqRKnVSOw0CIK8
	iFDRCxJSDpw7b8VBdpU2F1f3tceql027EdzYklJ96ECWeKfPiExSZCWx7+IZpPUEvCy6g8KUw3UdL
	tNHHJInvFr0o2mNLKgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ym9-00000003PGS-3WZD;
	Sat, 04 Apr 2026 11:02:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ym6-00000003PFa-09EN
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 11:02:47 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7dbd23bc684so69870a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 04:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775300564; cv=none;
        d=google.com; s=arc-20240605;
        b=WSjhYPUzc3Ok+gEOoBV7AFFleIMjsVcH0IYG5QO4FjnpC+nAHorANSUfp+9VpSfWQf
         GOBr8SIs9+2WGql2t/BlE1BO3EX91q90ih6ChmvWVwNrghYgsyByLjtevKfHN6J7MJRK
         izi8YVV1QbVSn+PmMNO1VrfbTFy3dfHvRT02I8oMkuHdD7XOexlJUSCe10KcYbPv/qar
         pxTTQCgp3jHmAxT/xEQSG2nEiAIYKkTDEchQfO3Z0lsuE+1v5m8llTkVOq5o6In5Tw/S
         yTifCePH42Rmu8DspCGOkCi0JIke8khpFbgW351m8Aw2d15drnNU7HEEnsgkd1wENCHW
         tm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zfu5+ZoRr42kiqQcxjxD/Vr+HX1maiYTYcsoR4uKhiw=;
        fh=F0YZ4uxJAidmwpnhOsLqwZSfQsVkE7WqxI7gEn94lJ4=;
        b=LW7Npge7SB/zygOyzXFzhRqJaftrxhkBxu2DsOcbfBE/xzfT9AdJzGtvgmipegnuoO
         1JVcevE0yGfWoyIheVfwnkgiCMGFPGjWN8eTX0wvNb1liUW8Xj/UkLImKQbjHGrlveyD
         2+RyYtGghAtJ/UkEIXBFpMOG3ZAXOCH4uFjll8AqfDfQU7PwOwmLxO0bfszLCdCG+a02
         c/ixJ3gz7L55UImO4RJmZne6ObNgVnG7yaAehHiDD+01y0qrnEcd5HbgaFRllrSOmU/R
         wZcxJ+VLawdTnew6H6C9sLxYB61KnchJMWKWirbYZhz4mgv//pUJ3nHS7UpTb7x0YJPp
         RTKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775300564; x=1775905364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zfu5+ZoRr42kiqQcxjxD/Vr+HX1maiYTYcsoR4uKhiw=;
        b=tyvrz5k10fywmvgCJtwQRTwJIx+2d3tqlS3IBX0H2kjPUT8meyE0SxPe1gME/tIP9p
         ipYyZD9OplTzQTbc3UFJM/eCgS25XIheNWOsDendjLZ9m9qXHsIcaH+eZWXm3lJaacv8
         BlNcsJPQy4phzl5eBEsLlJbdABC4Xvm+O6UZtN8bdjSiqOfRd7OvAP936QJRtZ+MbxeH
         hsZwTkjs2ro+rAiTUaaqbpl72SFCLcE+7qhZJPxs+To+1KRPag1PzCmkMdDSLjVtrfmV
         DsamwzBrhZ30SVIvRjkBOl6jxrRYsM0Y5i4HY20I6IGmw7qTFJGiMXSPkIZE6YpdO4se
         mHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775300564; x=1775905364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zfu5+ZoRr42kiqQcxjxD/Vr+HX1maiYTYcsoR4uKhiw=;
        b=UfCdUBF1aMDcImZe/FIoap9cBnvZd4Qm8QlE37Zw3grQACGOVvcKDs2j9uTXknYK13
         wZDru/7T2NZ59wPkOmkX2XwHy5WT/jJmYArVpfwA16E92Tr65NP1b7LwNlHta3WZyI4U
         IDWXuxKjbJpMrwIOddqamV9zFBEjHnYSy2hOFtLhTDQ2WnoygvuNPqRUbbO8aNn68wE7
         LHXz0u1Y2AfUxyaXCMI9mekbVja1Mlo2I/cumHrjwfDtihrHsHfgG2buxFzkqcNOwUtJ
         K6CwtxTLR32w+kGt35f2St/qwQFbYqJI/I4fFXHO7rNF6r78LhFaIZzeDXx5o3wQ7UtP
         z5ew==
X-Forwarded-Encrypted: i=1; AJvYcCUt8tu8F56VgqPEAmy4E2e250O1Xtx+AED1eXAU8HorluStJveG/Zbc5kKcXq9wP4cb06l+phWVpEJH+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwW8K6P7yl4JckcFrsyDtbBInuErH80YZ4xRNFwXiPWRvM1SOb4
	zkO8jP1e6mJ5u5spAErjaMQuqLAHJLc6PGp9on1Ob18YC8I0hNOlNoOaQDN+yQlWmD5rJM1icsY
	2CRdPvxJQ/LhhPN5mXp6sKHS6XZv7YSogZ3cN34KIww==
X-Gm-Gg: AeBDievo/ynHeNtfpIIt40Yc7x8dKLoo0+rIc2FmnCiiPkn7/cF4wGDxGDcwP2fEt++
	NF4L3Ig6dwTM4oLNegk7C+Djw46CfuZ8N+/7LY2xv4LVI9MfSirz0alB2xYBxNGCYM+Z8XyN/TX
	Gj5U9qNH07LxDVLSglzTkJraLcnkqHHo9aRY29LAb2gCQsBJVKg2675kYnJ7FnjFDZVo/gCSCfp
	WP7b96EbsZzgKi7FmPY72409dg2BXI/OXxgG0HYe6xCdu3YTXb/YDuRvifN9VW/y+IKtSK5ygsq
	xu1nzHI5Xj7nsoCmAVQOVbSaF5/zziy50o4MeHJ8e1i/x2Nxo3d/NcrM9S+3pzp/H0Ex1sPSaOZ
	do3+3Gfkz5ii0bLYTSD9PsQfKYg==
X-Received: by 2002:a05:6820:1ca8:b0:67e:3b11:89ed with SMTP id
 006d021491bc7-6821e66a08bmr3527858eaf.10.1775300564107; Sat, 04 Apr 2026
 04:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Apr 2026 16:32:32 +0530
X-Gm-Features: AQROBzDcUt7d2zmN-LgKMz3EEMCzhGSvhLBkGZy88YajEYGJjZyDS4lDfZXa79I
Message-ID: <CAAhSdy2t2WukRG7mHckY5=+J4+vPU1jvkrG9vqXoDxcMPbiEJg@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Support runtime configuration for per-VM's HGATP mode
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_040246_332753_51418144 
X-CRM114-Status: GOOD (  17.93  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA5OjAw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEN1cnJlbnRseSwgUklTQy1WIEtWTSBoYXJkY29kZXMgdGhlIEctc3RhZ2UgcGFn
ZSB0YWJsZSBmb3JtYXQgKEhHQVRQIG1vZGUpCj4gdG8gdGhlIG1heGltdW0gbW9kZSBkZXRlY3Rl
ZCBhdCBib290IHRpbWUgKGUuZy4sIFNWNTd4NCBpZiBzdXBwb3J0ZWQpLiBidXQKPiBvZnRlbiBz
dWNoIGEgd2lkZSBHUEEgaXMgdW5uZWNlc3NhcnksIGp1c3QgYXMgYSBob3N0IHNvbWV0aW1lcyBk
b2Vzbid0IG5lZWQKPiBzdjU3Lgo+Cj4gVGhpcyBwYXRjaCByZXVzZSBLVk1fQ0FQX1ZNX0dQQV9C
SVRTIHRvIHNlbGVjdCBIR0FUUC5NT0RFLiBVc2VyLXNwYWNlIGNhbgo+IG5vdyBleHBsaWNpdGx5
IHJlcXVlc3QgYSBzcGVjaWZpYyBIR0FUUCBtb2RlIChTVjM5eDQsIFNWNDh4NCwgU1Y1N3g0IG9y
Cj4gU1YzMng0KSBkdXJpbmcgVk0gY3JlYXRpb24uCj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY4Ogo+
ICAgICAtIFJldXNlIEtWTV9DQVBfVk1fR1BBX0JJVFMgdG8gYWR2ZXJ0aXNlIGFuZCBzZWxlY3Qg
dGhlIGVmZmVjdGl2ZSBHUEEgd2lkdGgKPiAgICAgICBmb3IgYSBWTSAoQW51cCdzIHN1Z2dlc3Rp
b24pLgo+ICAgICAtIEhhbmRsZSB0aGUga3ZtID09IE5VTEwgY2FzZSBhbmQgdGFzayBrdm0tPmxv
Y2sgYW5kIGt2bS0+c2xvdHNfbG9jayB0byBzZXJpYWxpemUKPiAgICAgICBhZ2FpbnN0IGNvbmN1
cnJlbnQgdkNQVSBjcmVhdGlvbiBhbmQgbWVtc2xvdCB1cGRhdGVzIChSYWRpbSdzIHN1Z2dlc3Rp
b24pLgo+ICAgICAtIExpbmsgdG8gdjc6Cj4gICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyNjA0MDIxMzIzMDMuNjI1Mi0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbS8KPiAtLS0KPiBDaGFuZ2VzIGluIHY3IChBbnVwJ3Mgc3VnZ2VzdGlvbnMpOgo+ICAgICAt
IEtlZXAgdGhlIG9yaWdpbmFsIEhHQVRQIG1vZGUgcHJvYmluZyBsb2dpYy4KPiAgICAgLSBMaW5r
IHRvIHY2Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYw
MzMwMTIyNjAxLjIyMTQwLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+IC0tLQo+IENo
YW5nZXMgaW4gdjYgKEFudXAncyBzdWdnZXN0aW9ucyk6Cj4gICAgIC0gUmV3b3JrZWQga3ZtX3Jp
c2N2X2dzdGFnZV9ncGFfYml0cygpIGFuZCBrdm1fcmlzY3ZfZ3N0YWdlX2dwYV9zaXplKCkgdG8K
PiAgICAgICB0YWtlICJ1bnNpZ25lZCBsb25nIHBnZF9sZXZlbHMiIGluc3RlYWQgb2YgInN0cnVj
dCBrdm1fYXJjaCAqIi4KPiAgICAgLSBNb3ZlZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUoKSBoZWxw
ZXIgZnJvbSBrdm1faG9zdC5oIHRvIGt2bV9nc3RhZ2UuaC4KPiAgICAgLSBSZW5hbWVkIGt2bS0+
YXJjaC5rdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgdG8ga3ZtLT5hcmNoLnBnZF9sZXZlbHMu
Cj4gICAgIC0gQWRkZWQgcGdkX2xldmVscyB0byBzdHJ1Y3Qga3ZtX2dzdGFnZSB0byBhdm9pZCBy
ZXBlYXRlZAo+ICAgICAgIGdzdGFnZS0+a3ZtLT5hcmNoIHBvaW50ZXIgY2hhc2luZy4KPiAgICAg
LSBMaW5rIHRvIHY1Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjYwMjA0MTM0NTA3LjMzOTEyLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+IC0t
LQo+IENoYW5nZXMgaW4gdjU6Cj4gICAgIC0gVXNlIGFyY2hpdGVjdHVyYWwgSEdBVFAuTU9ERSBl
bmNvZGluZ3MgYXMgdGhlIGJpdCBpbmRleCBmb3IgdGhlIHN1cHBvcnRlZC1tb2RlCj4gICAgICAg
Yml0bWFwIGFuZCBmb3IgdGhlIFZNLW1vZGUgc2VsZWN0aW9uIFVBUEk7IG5vIG5ldyBVQVBJIG1v
ZGUvYml0IGRlZmluZXMgYXJlCj4gICAgICAgaW50cm9kdWNlZChwZXIgUmFkaW0pLgo+ICAgICAt
IEFsbG93IEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUgb24gUlYzMiBhcyB3ZWxsKHBlciBE
cmV3KS4KPiAgICAgLSBMaW5rIHRvIHY0Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjYwMjAyMTQwNzE2LjM0MzIzLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tLwo+IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4gICAgIC0gRXh0ZW5kIGt2bV9yaXNjdl9n
c3RhZ2VfbW9kZV9kZXRlY3QoKSB0byBwcm9iZSBhbGwgSEdBVFAuTU9ERSB2YWx1ZXMKPiAgICAg
ICBzdXBwb3J0ZWQgYnkgdGhlIGhvc3QgYW5kIHJlY29yZCB0aGVtIGluIGEgYml0bWFzay4KPiAg
ICAgLSBUcmVhdCB1bmV4cGVjdGVkIHBnZF9sZXZlbHMgaW4ga3ZtX3Jpc2N2X2dzdGFnZV9tb2Rl
KCkgYXMgYW4gaW50ZXJuYWwgZXJyb3IKPiAgICAgICAoZS5nLiBXQVJOX09OX09OQ0UoKSkocGVy
IFJhZGltKS4KPiAgICAgLSBNb3ZlIGt2bV9yaXNjdl9nc3RhZ2VfZ3BhX2JpdHMoKSBhbmQga3Zt
X3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZSgpIHRvIGhlYWRlcgo+ICAgICAgIGFzIHN0YXRpYyBpbmxp
bmUgaGVscGVycyhwZXIgUmFkaW0pLgo+ICAgICAtIERyb3AgZ3N0YWdlX21vZGVfdXNlcl9pbml0
aWFsaXplZCBhbmQgUmVtb3ZlIHRoZSBrdm1fZGVidWcoKSBtZXNzYWdlIGZyb20KPiAgICAgICBL
Vk1fQ0FQX1JJU0NWX1NFVF9IR0FUUF9NT0RFKHBlciBSYWRpbSkuCj4gICAgIC0gTGluayB0byB2
MzoKPiAgICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyNTE1
MDQ1MC4yNzA2OC0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiAtLS0KPiBDaGFuZ2Vz
IGluIHYzOgo+ICAgICAtIFJld29ya2VkIHRoZSBwYXRjaCBmb3JtYXR0aW5nIChwZXIgRHJldyku
Cj4gICAgIC0gRHJvcHBlZCBrdm0tPmFyY2gua3ZtX3Jpc2N2X2dzdGFnZV9tb2RlIGFuZCBkZXJp
dmUgSEdBVFAuTU9ERSBmcm9tCj4gICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIHZp
YSBhIGhlbHBlciwgYXZvaWRpbmcgcmVkdW5kYW50IHBlci1WTSBzdGF0ZShwZXIgRHJldykuCj4g
ICAgIC0gUmVtb3ZlZCBrdm1fcmlzY3ZfZ3N0YWdlX21heF9tb2RlIGFuZCBrZWVwIG9ubHkga3Zt
X3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscwo+ICAgICAgIGZvciBob3N0IGNhcGFiaWxpdHkg
ZGV0ZWN0aW9uKHBlciBEcmV3KS4KPiAgICAgLSBPdGhlciBpbml0aWFsaXphdGlvbiBhbmQgcmV0
dXJuIHZhbHVlIGlzc3VlcyhwZXIgRHJldykuCj4gICAgIC0gRW5mb3JjZSB0aGF0IEtWTV9DQVBf
UklTQ1ZfU0VUX0hHQVRQX01PREUgY2FuIG9ubHkgYmUgZW5hYmxlZCBiZWZvcmUgYW55IHZDUFVz
Cj4gICAgICAgYXJlIGNyZWF0ZWQgYnkgcmVqZWN0aW5nIHRoZSBpb2N0bCBvbmNlIGt2bS0+Y3Jl
YXRlZF92Y3B1cyBpcyBub24temVybyhwZXIgUmFkaW0pLgo+ICAgICAtIEFkZCBhIG1lbXNsb3Qg
c2FmZXR5IGNoZWNrIGFuZCByZWplY3QgdGhlIGNhcGFiaWxpdHkgdW5sZXNzCj4gICAgICAga3Zt
X2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSBpcyB0cnVlLCBlbnN1cmluZyB0aGUgRy1zdGFn
ZSBmb3JtYXQgaXMgbm90Cj4gICAgICAgY2hhbmdlZCBhZnRlciBhbnkgbWVtc2xvdHMgaGF2ZSBi
ZWVuIGluc3RhbGxlZChwZXIgUmFkaW0pLgo+ICAgICAtIExpbmsgdG8gdjI6Cj4gICAgICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAxMDUxNDMyMzIuNzY3MTUtMS1m
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20vCj4KPiBGYW5neXUgWXUgKDMpOgo+ICAgUklTQy1W
OiBLVk06IFN1cHBvcnQgcnVudGltZSBjb25maWd1cmF0aW9uIGZvciBwZXItVk0ncyBIR0FUUCBt
b2RlCj4gICBSSVNDLVY6IEtWTTogQ2FjaGUgZ3N0YWdlIHBnZF9sZXZlbHMgaW4gc3RydWN0IGt2
bV9nc3RhZ2UKPiAgIFJJU0MtVjogS1ZNOiBSZXVzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTIHRvIHNl
bGVjdCBIR0FUUC5NT0RFCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgg
fCA0NyArKysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAgICB8IDY1
ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAg
ICAgICAgICAgICB8IDEyICsrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAg
ICAgIHwgNzAgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dm0uYyAgICAgICAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKystLQo+ICBhcmNoL3Jp
c2N2L2t2bS92bWlkLmMgICAgICAgICAgICAgICB8ICAzICstCj4gIDcgZmlsZXMgY2hhbmdlZCwg
MTQ4IGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjUwLjEKPgoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC03LjEKClRoYW5rcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
