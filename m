Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ED1EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRnLScI6NP5xsvQL4zbkTauvPKBiuoB4FY+Dwa83m9Y=; b=f6QV2fQWnOJoay
	YmhR+ntOxzw58zL2blo2Wxpu/FAQLAqx/MKrdmnD8TJbW7NdZclD5k9WUwT23P4jg24qAd67b4NxU
	K9ovo3bqAp48psXoBq3cejeA0t8a4AEA+HHN/ut/z4FcWx6i7fFFsopTjnGjVp68oGlbMty5ctWv9
	nvhYQAW6oWSfrZuJKwK4FDt52rvfZZhViCI9HuZ/l/0bjJ4Jk+Z7kPBb0tVuNcVaKRtKh/ad7JaJU
	jzlV+1qznmIvv+6lU+opQDnET6Y63Wyg4PT7vcqDmTJYQwyncW1M8lUabLJbDO5thCIoGFt5zFDFq
	NXeJhz5rff7qW77glxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8bJ-007q0Y-23;
	Wed, 19 Jul 2023 14:56:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8bD-007pxJ-2T;
	Wed, 19 Jul 2023 14:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nZU6p3n7fickF5wKWXmSN8Sc6/MSvsFTYGP0irgDDx8=; b=ah7F62m4qs6sj4vGuupE0f42A6
	eAh4Rr+IgMbp+BpPuVsBRlI0MYmKD5HSvpPkxMcykmOBKFVTKVh1bTmo1eUyz2Hmbok64BtiM4htf
	pB5OMUTpExMSE1/JQ80JaRQ6TQDS5BoIO06Xv97w/mA+Mhs2a+KkTamEq0txfUF3WcwtcRT/lW9Ar
	TInGZgy9rv+qyplKE9ZBD8xOoHIKWId/Kx2t01drGPj0MEOd8o5ji9vJGQ/9i+j+JsYdgCzNZ7r7d
	w0Y45soQ2yttAD+NERDg47BeBhnfuUvTpLjIBMZMXbPqGZ/Fc5AdeG9WoSVLV6JCJ2xDsuoglVUfR
	zrENT31A==;
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8LV-00DYee-0k;
	Wed, 19 Jul 2023 14:40:08 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id C6F93580210;
	Wed, 19 Jul 2023 10:39:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 19 Jul 2023 10:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689777595; x=1689784795; bh=nZU6p3n7fickF5wKWXmSN8Sc6/MSvsFTYGP
	0irgDDx8=; b=F6uhOe0xlOcUS4dDy1oq5df2GK1xAMcbSu8LZgoyXmvhlUzRu78
	bGWxTgJiJi6zrRqVfawYfkrNgFxRyoDY1fhSxgqhl2HFLNsxG4oCXLOUvtc1H1J9
	yKpHN5YOXPSGucUUa4WBBwirLFW7BcNoa9nEJIN8VY/wxM9DZRnEh0QMcm0tWtCR
	dKTHuIxJjhaZFzLsV9DTjnLCbGrttI4s9sB6wKBYnGTTcqvQf0+2gn/VHNspuTtL
	UCPm3ZVAMHyA6sMFGbrinOOlTU5JT8hRDtp3UUk+cM86plnrvFOW8ztaQcBfW6T8
	F6uE/5iwV3Pzt0P1Egm7uCnyHKH+4DwB/7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1689777595; x=1689784795; bh=nZU6p3n7fickF5wKWXmSN8Sc6/MSvsFTYGP
	0irgDDx8=; b=RT3ufktFiEmOaEJtwn2kNPwX1CxJHO84CaryEahSFHfcxzKAOKP
	GbsmwKdkij2/wPBd7ZceYMaF8fRakoZMD4mqWlf0Zxmc3G8CDJFEJnfyubpj4GpK
	BTGeK/U7hKm6Xv3VxJI6XGVSS5z+dkFKgATEYbUSs/PzvBavnLdZpIWHdDX7DPwN
	15x30i+ixySDP0gi6hrqw9TjDxXFUe4m0DoLzGSNryLWDKksDFvYLsm8ExaZoHgl
	VF+nPTLS/vCYm/jinaZDPIrkGemb4sE71T5g0dm8v0j1hZVFJOBDNUTynb37Cocc
	llP48wfwjZ64vJQYBWEmvFIXuwbXcmFTjiw==
X-ME-Sender: <xms:ufW3ZC1LS5m9UKqBhQuPj22bYT-l75QF5t_3QZRuDsR0diLe9lLwGw>
    <xme:ufW3ZFGMC4Z62j2k7HNixKVxkcNQLWa51LhFl6gqjTpK2ZIicA3j_emCMD3xuz8zQ
    hmPOfevWc3CjAvXV24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeekgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ufW3ZK7cBwP-5t-w3Jii5GSAwmRO2vIKKvzkCybK4fyj3fTpVbuJ2w>
    <xmx:ufW3ZD226POzlBb4fCk2wx_vpHfAiQhRjkNsitzyPc0-y9jpD7VJsQ>
    <xmx:ufW3ZFEqUBBuoMKH8obMLFVqcVdLIfR3eGLzM9iysb6atqfn6fvnvQ>
    <xmx:u_W3ZHdVkYp3ilmsy75YQ8mHYcQu1Ydj0R4Y7tJxHDydj5XN6uRexQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8026EB60086; Wed, 19 Jul 2023 10:39:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <3b047cd4-a61f-44b6-830b-b4e35bfccd72@app.fastmail.com>
In-Reply-To: <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-6-arnd@kernel.org>
 <32595080-dd79-5cf0-46e7-b82d0df8f067@linaro.org>
Date: Wed, 19 Jul 2023 16:38:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Will Deacon" <will@kernel.org>,
 linux-efi@vger.kernel.org, guoren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 "WANG Xuerui" <kernel@xen0n.name>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Dave Airlie" <airlied@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Wei Liu" <wei.liu@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Deepak Rawat" <drawat.floss@gmail.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Matt Turner" <mattst88@gmail.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Borislav Petkov" <bp@alien8.de>,
 loongarch@lists.linux.dev,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 "Khalid Aziz" <khalid@gonehiking.org>, "Brian Cain" <bcain@quicinc.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 linux-riscv@lists.infradead.org, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 5/9] vgacon: remove screen_info dependency
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_154006_853709_91A46231 
X-CRM114-Status: GOOD (  11.69  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMsIGF0IDE1OjQ5LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3
cm90ZToKPiBPbiAxOS83LzIzIDE0OjM5LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgoKPj4gQEAgLTEw
NzQsMTMgKzEwNzcsMTMgQEAgc3RhdGljIGludCB2Z2Fjb25fcmVzaXplKHN0cnVjdCB2Y19kYXRh
ICpjLCB1bnNpZ25lZCBpbnQgd2lkdGgsCj4+ICAgCQkgKiBIbyBobyEgIFNvbWVvbmUgKHN2Z2F0
ZXh0bW9kZSwgZWg/KSBtYXkgaGF2ZSByZXByb2dyYW1tZWQKPj4gICAJCSAqIHRoZSB2aWRlbyBt
b2RlISAgU2V0IHRoZSBuZXcgZGVmYXVsdHMgdGhlbiBhbmQgZ28gYXdheS4KPj4gICAJCSAqLwo+
PiAtCQlzY3JlZW5faW5mby5vcmlnX3ZpZGVvX2NvbHMgPSB3aWR0aDsKPj4gLQkJc2NyZWVuX2lu
Zm8ub3JpZ192aWRlb19saW5lcyA9IGhlaWdodDsKPj4gKwkJdmdhX3NpLT5vcmlnX3ZpZGVvX2Nv
bHMgPSB3aWR0aDsKPj4gKwkJdmdhX3NpLT5vcmlnX3ZpZGVvX2xpbmVzID0gaGVpZ2h0Owo+PiAg
IAkJdmdhX2RlZmF1bHRfZm9udF9oZWlnaHQgPSBjLT52Y19jZWxsX2hlaWdodDsKPj4gICAJCXJl
dHVybiAwOwo+PiAgIAl9Cj4+IC0JaWYgKHdpZHRoICUgMiB8fCB3aWR0aCA+IHNjcmVlbl9pbmZv
Lm9yaWdfdmlkZW9fY29scyB8fAo+PiAtCSAgICBoZWlnaHQgPiAoc2NyZWVuX2luZm8ub3JpZ192
aWRlb19saW5lcyAqIHZnYV9kZWZhdWx0X2ZvbnRfaGVpZ2h0KS8KPj4gKwlpZiAod2lkdGggJSAy
IHx8IHdpZHRoID4gdmdhX3NpLT5vcmlnX3ZpZGVvX2NvbHMgfHwKPj4gKwkgICAgaGVpZ2h0ID4g
KHZnYV9zaS0+b3JpZ192aWRlb19saW5lcyAqIHZnYV9kZWZhdWx0X2ZvbnRfaGVpZ2h0KS8KPj4g
ICAJICAgIGMtPnZjX2NlbGxfaGVpZ2h0KQo+PiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAgCj4+
IEBAIC0xMTEwLDggKzExMTMsOCBAQCBzdGF0aWMgdm9pZCB2Z2Fjb25fc2F2ZV9zY3JlZW4oc3Ry
dWN0IHZjX2RhdGEgKmMpCj4+ICAgCQkgKiBjb25zb2xlIGluaXRpYWxpemF0aW9uIHJvdXRpbmVz
Lgo+PiAgIAkJICovCj4+ICAgCQl2Z2FfYm9vdHVwX2NvbnNvbGUgPSAxOwo+PiAtCQljLT5zdGF0
ZS54ID0gc2NyZWVuX2luZm8ub3JpZ194Owo+PiAtCQljLT5zdGF0ZS55ID0gc2NyZWVuX2luZm8u
b3JpZ195Owo+PiArCQljLT5zdGF0ZS54ID0gdmdhX3NpLT5vcmlnX3g7Cj4+ICsJCWMtPnN0YXRl
LnkgPSB2Z2Ffc2ktPm9yaWdfeTsKPgo+IE5vdCByZWFsbHkgbXkgYXJlYSwgc28gYmFyZSB3aXRo
IG1lIGlmIHRoaXMgaXMgb2J2aW91c2x5IG5vdAo+IHBvc3NpYmxlIDopIElmIHVzaW5nIERVTU1Z
X0NPTlNPTEUsIGNhbiB3ZSB0cmlnZ2VyIGEgc2F2ZV9zY3JlZW4KPiAvIHJlc2l6ZT8gSWYgc28s
IHdlJ2QgcmVhY2ggaGVyZSB3aXRoIHZnYV9zaT1OVUxMLgo+CgpJIHRoaW5rIGl0IGNhbm5vdCBo
YXBwZW4gYmVjYXVzZSB0aGUgb25seSB3YXkgdGhhdCBhbnl0aGluZyBjYWxscwppbnRvIHZnYWNv
bi5jIGlzIHRocm91Z2ggdGhlICJjb25zd2l0Y2hwID0gJnZnYV9jb247IiB0aGF0IG5vdyBoYXBw
ZW5zCmF0IHRoZSBzYW1lIHRpbWUgYXMgdGhlICJ2Z2Ffc2kgPSAmc2NyZWVuX2luZm87Ii4gSXQn
cyBkZWZpbml0ZWx5CnBvc3NpYmxlIHRoYXQgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGFzIHdlbGwg
aGVyZS4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
