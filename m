Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2F4CA5FF5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQrO1ZDQ+8cYVVXZ7eyyoozZD2AbTDMxQCQSdmeHdSw=; b=RSvgE0qNDgMnmc
	WU1TTpsvK/c2NyycFmi4ZcERcBuZtRbkV0cOfFEArP94gYXj2c+S/6Q3YWACYYLB7sC89raQ7RIjF
	Te7Tk5qrQ2P1Jbd2A+RPtagEGaF25Z6JOmaWu2n0JRzSBMhUCY+nwl0dPT2wS3cTMwJ/THTTlmeLQ
	rRZWj1yPCOygjMVLjKaslKpWlQkzlAmTfs414Ua8xhHDMpQEs8UAKEQzCd1c4J1zxY4bP7GqWX/zl
	/v8PH9m+eWWlwGvxIlt+2j6OIN/GUYDd+QpNmDDEGlbMRikHuxpgKuWmzrnfoBgCin2eKGaRV/fyb
	Kg3jzbs4yTfANgP3o4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMb-0000000HHlZ-0kya;
	Mon, 05 Oct 2026 22:40:53 +0000
Received: from mail-yx2-x23.google.com ([2607:f8b0:4864:41::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMY-0000000HHhU-2VCe
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 22:40:51 +0000
Received: by mail-yx2-x23.google.com with SMTP id 956f58d0204a3-6762de1c77eso1831421d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 15:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791240049; cv=none;
        d=google.com; s=arc-20260327;
        b=b42/zIBsf/U5MVpFC4GwyJ/gKqOk4jyL1NVyVL1tZ93C5fzsPW/edg7QTv6H5b05a3
         9tdAoOoS7XVHWCwo0ALy6DkDIp+9fM5AEpeofbWKe4cJTKf1JSo7+AZUL/Lo117Jsh5d
         4lZ/ggymP15MbCkFJxSBnudnWD23enb5ngE791pwyRFEAguXw0ZglCAnvrPeenhjVL6J
         ZH/2yGesG39URPQwNjVwrvk4EWt43xGxv+IqjnJJyI/zfcFpRQk+24k37pyyRDhtGUtX
         qYEqGHW6liC8ZCL0TP4UC56UH4sxDxabgsoC8oekoxjHlEk1TTLfUyRhXhpIygC/tw94
         7wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        fh=sACkIpDIO0I5PEkp6ng+NOEFfE+qtih3p116nGCCF24=;
        b=m/Nhzk4cECosZwaSSqrVCRZTUPK1A9dVsLnZAHkv/bStIyXzrbnpCOeSXVwNA0wbm0
         RTrnce/OBslJjiQfyGrr4yXid8Gw8SWNRXyIwOYcbddpbRRMIRHbV3UHYrf6GqtTLELI
         bx6Wn3M50HlpHUYQde8zDNwYARZJqssdFNcqY9Mcj5khtYXGgMqI+2uVIOH1PPEDOjcG
         S56sd6dBJHCc9QY0YVVP7guHxmIMJaYu+0g244yqSsFpvOJFVS6Jimq7apfFvpoWG5A3
         ug7n6Zv0d/FND4u+rjrWN9SNYzzcI+IGLejkQZDTYusRTT2awsppEtjhNrIuWXcCTPtB
         TDHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791240049; x=1791844849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        b=MoqLOTwrJb/61+KPF37F846o1YYLqN4xDdl4f5a9wbXJybEQ+C0YTUdlOepmVxd73N
         no94Z6uxpq5gc9MPxVq96wuqWHBneQBP8Q1f7pWg7diA5n9Vi/kHHE/R+nnTBEZFfM1C
         YCX7KeQqNZ+lqpU4zpGvyllnIyJHptPSt+SldjDS5+sbhehzr5GDA6F/GfpryNowPzDm
         Hdrpye6XIBN5O+zG/EguDW5GezH7knapocZjnp48CoNJulGtUe3rl0zyOBWF1zTRAjAW
         PDBTKQK/xU2LAwO2izf0BNF+g6nFs70drkYuATEDg4oUbfR/LdxPqTcxOmcr2BzOXz0c
         1JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240049; x=1791844849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yoy4+gNGcQV5h8mXnlsNwLFsTZ1uQXaQDtjTnekUSzk=;
        b=uY3lGUY2czLVu9hzGupsiN3NfJQd/j5TgaAT/7EMho7jR7bM4fr8uubpkt83SIBDmI
         oQa0F2Tsn2UeTGcHAi0Hqe+uRbm9K5Qh433pMBljCdS4tDUOLaImAu+0usNzs4xCI2Ds
         g91ODPw68IW/0fA8zJfIlPdhHubzy02LEkqLuwykY1+Wj9SEDp3y8ERgKk2CCz14DpXB
         zCkadevWHMJlFre+AemYhEqaPCr3dGTgc3prvWN5JrjOFs7bT1QRg4Y0N63GB8u9xO1s
         M1V/gLqJcK5iZgI8ZB7oG62wDqJwwAscpfNtRp0Yfa37nX/7JDs3EIIisFEaQgMCMnOb
         Ux1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzePTh/0KZH8rLpMpjhC1TxYre4ukfjEeztl92M6H2Rlnor9OoBmWhIkzhnNKm+gSrNXvgfbUk54fj0A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKYSLIaYDMQt3+RhZr1m/VoxLEKUInLkYAEdValvAZCMHyWoETt
	NVL+DOVobkhVtp2g1hdpBGJqxn/91/rPr7KdoMo3WNTJSezHkkYgTsaFOpanFlh0/dRthkKtUU4
	223odWwdKH+nBIFgF28gM7qz3+XrmDqh0sgr3FkzIJA==
X-Gm-Gg: AYBFou3ijmPbkgKtoXM+INFL41FF+C6bnP4rknqT8ePiNUTNiP4w4m5xPUwrO3SYiSP
	uO+DIt1VGnZaWaw87kzV2zJEnUOsa9ftAl1M46EHNzEyyrkqexZOeGmOw3s3CrCrYrw1LH23p7t
	JuRiHUDHYy4+GwBq0y+xCClcnobuHwSWEHSgVFZTtXuzjenOM0X/k97ZbR8GOQRZAakyca9chne
	HdtIWqcm+XH9BRYGSw0BiTQeQeWhsxvl7Zos8ghNDSQYP8U3am7w3ilGjP8wBctev5ruck9JXVB
	cVEgyhEtOdzLVR41dEWw3EM7XLSoHgepugTbVSTGwhTlse2d+d2Go1ExBuSNdA6+ImaUYyquEc1
	/JNxs8KribZk=
X-Received: by 2002:a53:eb86:0:b0:677:a004:4c3b with SMTP id
 956f58d0204a3-677ac155deemr3157728d50.127.1791240048910; Mon, 05 Oct 2026
 15:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca> <asQcQIh56MV1OJur@lore-desk>
In-Reply-To: <asQcQIh56MV1OJur@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 5 Oct 2026 17:40:36 -0500
X-Gm-Features: AclHuK_waBcUE5jt710thOReYEcaNoXlOFQ7cNij63z-oA9tFI26Hbx-S3DtTtI
Message-ID: <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154050_663952_C27F0C55 
X-CRM114-Status: GOOD (  25.46  )
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

SGkgTG9yZW56bywKCk9uIE1vbiwgT2N0IDUsIDIwMjYgYXQgNDo1M+KAr1BNIExvcmVuem8gQmlh
bmNvbmkKPGxvcmVuem8uYmlhbmNvbmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiA+IE9u
IFR1ZSwgU2VwIDI5LCAyMDI2IGF0IDAzOjEwOjExUE0gKzAyMDAsIExvcmVuem8gQmlhbmNvbmkg
d3JvdGU6Cj4gPiA+IHN0bW1hY191cGRhdGVfc3Vic2Vjb25kX2luY3JlbWVudCgpIGlnbm9yZXMg
dGhlIGVycm9yIHJldHVybmVkIGJ5Cj4gPiA+IHN0bW1hY19jb25maWdfYWRkZW5kKCksIGFuZCBz
dG1tYWNfaW5pdF90c3RhbXBfY291bnRlcigpIGRpc2NhcmRzIHRoZQo+ID4gPiBhZGRlbmQgYW5k
IHN5c3RlbSB0aW1lIHByb2dyYW1taW5nIGVycm9ycywgYWx3YXlzIHJldHVybmluZyBzdWNjZXNz
LiBBCj4gPiA+IGZhaWx1cmUgdG8gcHJvZ3JhbSB0aGUgYWRkZW5kIChQVFBfVENSX1RTQUREUkVH
KSBvciB0byBpbml0aWFsaXplIHRoZQo+ID4gPiBzeXN0ZW0gdGltZSBjb3VudGVyIChQVFBfVENS
X1RTSU5JVCkgaXMgdGhlcmVmb3JlIHNpbGVudGx5IHN3YWxsb3dlZCwKPiA+ID4gbGVhdmluZyB0
aGUgaGFyZHdhcmUgdGltZXN0YW1wIGNvdW50ZXIgaW4gYSBub24tcnVubmluZyBvciBwYXJ0aWFs
bHkKPiA+ID4gY29uZmlndXJlZCBzdGF0ZSB3aGlsZSB0aGUgZHJpdmVyIGtlZXBzIG9wZXJhdGlu
ZyBhcyBpZiB0aW1lc3RhbXBpbmcKPiA+ID4gd2VyZSB1cC4gVGhpcyBtYXR0ZXJzIGZvciBUQVBS
SU8vRVNUIG9mZmxvYWRpbmcsIHdoaWNoIGRlcml2ZXMgdGhlIGdhdGUKPiA+ID4gYmFzZSB0aW1l
IGZyb20gdGhlIGhhcmR3YXJlIHRpbWVzdGFtcCBjb3VudGVyLgo+ID4gPgo+ID4gPiBUaGUgc2Ft
ZSBob29rcyBhcmUgYWxzbyBjYWxsZWQgZnJvbSB0aGUgUEhDIGNhbGxiYWNrczogc2V0dGltZTY0
IGFuZAo+ID4gPiBhZGpmaW5lIGRyb3AgdGhlIGVycm9yIGFuZCByZXBvcnQgc3VjY2VzcyB0byBj
bG9ja19zZXR0aW1lKCkgYW5kCj4gPiA+IGNsb2NrX2FkanRpbWUoKSwgc28gYSBkZWFkIFBUUCBy
ZWZlcmVuY2UgY2xvY2sgZ29lcyB1bm5vdGljZWQgYnkKPiA+ID4gcHRwNGwvcGhjMnN5cy4KPiA+
ID4KPiA+ID4gUmV0dXJuIGVycm9yIGNvZGVzIGZyb20gc3RtbWFjX3VwZGF0ZV9zdWJzZWNvbmRf
aW5jcmVtZW50KCksCj4gPiA+IHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKCksIHN0bW1hY19k
bF90c19jb2Fyc2Vfc2V0KCkgYW5kIHRoZQo+ID4gPiBzZXR0aW1lNjQvYWRqZmluZSBjYWxsYmFj
a3MgaW5zdGVhZCBvZiBzaWxlbnRseSByZXR1cm5pbmcgc3VjY2Vzcy4gT24KPiA+ID4gZmFpbHVy
ZSwgcm9sbCBiYWNrIHRoZSBwYXJ0aWFsbHkgYXBwbGllZCBjb25maWd1cmF0aW9uIHNvIHRoZSBo
YXJkd2FyZQo+ID4gPiBhbmQgdGhlIGRyaXZlciBib29ra2VlcGluZyBzdGF5IGNvbnNpc3RlbnQs
IGFuZCByZXBvcnQgdGhlIHJlYXNvbgo+ID4gPiB0aHJvdWdoIHRoZSBkZXZsaW5rIGV4dGFjay4g
QWxzbyBndWFyZCBhZ2FpbnN0IGEgemVybyBzdWItc2Vjb25kCj4gPiA+IGluY3JlbWVudCwgd2hp
Y2ggd291bGQgb3RoZXJ3aXNlIGRpdmlkZSBieSB6ZXJvIHdoZW4gY29tcHV0aW5nIHRoZQo+ID4g
PiBhZGRlbmQuCj4gPiA+Cj4gPiA+IFJlc2V0IHRoZSBwZXJzaXN0ZW50IHRpbWVzdGFtcGluZyBz
dGF0ZSAoaHd0c190eF9lbiwgaHd0c19yeF9lbiwKPiA+ID4gdHN0YW1wX2NvbmZpZywgc3lzdGlt
ZV9mbGFncyBhbmQgdHNmdXBkdF9jb2Fyc2UpIHdoZW4gKHJlKWluaXRpYWxpemluZwo+ID4gPiB0
aW1lc3RhbXBpbmcsIHNvIGEgZmFpbGVkIGluaXQgZG9lcyBub3QgbGVhdmUgVFgvUlggdGltZXN0
YW1waW5nCj4gPiA+IGVuYWJsZWQgb24gYSBjb3VudGVyIHRoYXQgbmV2ZXIgc3RhcnRlZC4KPiA+
ID4KPiA+ID4gRml4ZXM6IGNjNGM5MDAxY2UzMSAoIm5ldDogc3RtbWFjOiBTd2l0Y2ggc3RtbWFj
X2h3dGltZXN0YW1wIHRvIGdlbmVyaWMgSFcgSW50ZXJmYWNlIEhlbHBlcnMiKQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMb3JlbnpvIEJpYW5jb25pIDxsb3JlbnpvLmJpYW5jb25pQG9zcy5xdWFsY29t
bS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPiAtIERvIG5vdCBydW4g
c3RtbWFjX2NvbmZpZ19hZGRlbmQoKSBpbgo+ID4gPiAgIHN0bW1hY191cGRhdGVfc3Vic2Vjb25k
X2luY3JlbWVudCgpIGVycm9yIHBhdGguCj4gPiA+IC0gUmV0dXJuIGVycm9yIGZyb20gc3RtbWFj
X2FkanVzdF9mcmVxKCkgYW5kIHN0bW1hY19zZXRfdGltZSgpLgo+ID4gPiAtIFJlc2V0IGh3IHRz
IGNvbmZpZ3VyYXRpb24gaW4gc3RtbWFjX2luaXRfdGltZXN0YW1waW5nKCkuCj4gPiA+IC0gTGlu
ayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDkyNC1zdG1tYWMtcHRwLWFk
ZGVkLXN5c3RpbWUtZXJyb3ItdjItMS1iZWIyYTZiNWY4NjZAb3NzLnF1YWxjb21tLmNvbQo+ID4g
Pgo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAtIEluaXRpYWxpemUgc2VjX2luYyB0byAwIGlu
IHN0bW1hY19yZXN0b3JlX3N1YnNlY29uZF9pbmNyZW1lbnQoKQo+ID4gPiAgIHJvdXRpbmUuCj4g
PiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDkyMC1zdG1t
YWMtcHRwLWFkZGVkLXN5c3RpbWUtZXJyb3ItdjEtMS04YWM5ZTdhM2ZjZTJAb3NzLnF1YWxjb21t
LmNvbQo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19tYWluLmMgfCAxMDYgKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jICB8ICAxMCArLQo+ID4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBIZWxsbywgSSdtIG5vdGljaW5nIHRoYXQgYWZ0ZXIgdGhpcyBwYXRjaCB3YXMgbWVyZ2Vk
IGludG8gbGludXgtbmV4dCwKPiA+IGJvb3Qgc2VlbXMgdG8gaGFuZyB3aGVuIGlwPWRoY3AgaXMg
dXNlZCBiZWNhdXNlIGV0aGVybmV0IGlzbid0IHdvcmtpbmcKPiA+IG9uIHRoZSBUSDE1MjAgTGlj
aGVlIFBpIDRhLiBUaGVzZSBsaW5lcyBnZXQgcHJpbnRlZCBpbiBhIGxvb3Agb3ZlciBhbmQKPiA+
IG92ZXIKPiA+Cj4gPiBJUC1Db25maWc6IGVuZDAgaGFyZHdhcmUgYWRkcmVzcyA3MjpjYTphODpl
YjoyNzpbICAgMjQuODcyOTgyXSB0aGVhZC1kd21hYyBmZmU3MDcwMDAwLmV0aGVybmV0IGVuZDA6
IFJlZ2lzdGVyIE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMAo+ID4gZjIgbXR1IDE1MDAgREhDUAo+
ID4gWyAgIDI0LjkwMDQxMl0gdGhlYWQtZHdtYWMgZmZlNzA3MDAwMC5ldGhlcm5ldCBlbmQwOiBQ
SFkgW3N0bW1hYy0wOjAxXSBkcml2ZXIgW1JUTDgyMTFGIEdpZ2FiaXQgRXRoZXJuZXRdIChpcnE9
UE9MTCkKPiA+IFsgICAyNC45MTI3ODBdIGR3bWFjMTAwMDogTWFzdGVyIEFYSSBwZXJmb3JtcyBh
bnkgYnVyc3QgbGVuZ3RoCj4gPiBbICAgMjQuOTEyODAxXSB0aGVhZC1kd21hYyBmZmU3MDcwMDAw
LmV0aGVybmV0IGVuZDA6IE5vIFNhZmV0eSBGZWF0dXJlcyBzdXBwb3J0IGZvdW5kCj4gPiBbICAg
MjUuMDEwMjI5XSB0aGVhZC1kd21hYyBmZmU3MDcwMDAwLmV0aGVybmV0IGVuZDA6IFBUUCBpbml0
IGZhaWxlZAo+ID4gU0lPQ1NJRkZMQUdTOiBDb25uZWN0aW9uIHRpbWVkIG91dAo+Cj4gSGkgQW5p
cnVkaCwKPgo+IGJhc2VkIG9uIHRoZSByZXBvcnRlZCBlcnJvciwgc3RtbWFjX2luaXRfdHN0YW1w
X2NvdW50ZXIoKSBmYWlscyB3aXRoCj4gLUVUSU1FRE9VVC4gSW4gcGFydGljdWxhciB0aGlzIGNh
biBvY2N1cnMgaWY6Cj4KPiBzdG1tYWNfaW5pdF90c3RhbXBfY291bnRlcigpCj4gIC0+IHN0bW1h
Y191cGRhdGVfc3Vic2Vjb25kX2luY3JlbWVudCgpIC0+IHN0bW1hY19jb25maWdfYWRkZW5kKCkg
LT4gLUVUSU1FRE9VVAo+ICAtPiBzdG1tYWNfaW5pdF9zeXN0aW1lKCkgLT4gLUVUSU1FRE9VVAo+
Cj4gSSBndWVzcyB3ZSBzaG91bGQgdW5kZXJzdGFuZCB3aGljaCBvbmUgaXMgZmFpbGluZyBhbmQg
d2h5IGl0IGlzIGZhaWxpbmcuCgpJdCBzZWVtcyBsaWtlIGJvdGggYXJlIHRpbWluZyBvdXQsIGJv
dGggY29uZmlnX2FkZGVuZAooUFRQX1RDUl9UU0FERFJFRykgYW5kIGluaXRfc3lzdGltZSAoUFRQ
X1RDUl9UU0lOSVQpLgoKUmVnYXJkcwpBbmlydWRoIFNyaW5pdmFzYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
