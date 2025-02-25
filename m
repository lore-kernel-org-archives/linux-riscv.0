Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358BBC18E7C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=020YpKvV4xFIOUrbYqnaG5XkUyS0fc9tW7QkAkpGc2A=; b=URrSHj1SBrowbJ
	jL+Vel1dW6Wx44OiXFbddDkpB8aqvNO1HVZXFHVkj7X8/etZ/Ub2Vc4ot2+mdYDaAOTWs5iIPTyc7
	G+SeSjqzQHiImPbToEgVsqXdSVly79glxNlQTcJBDnfV2NsPc0IV5BWeqh8oxoRmSrp6wmSk6kzcj
	LzbViINztivwaaG8CYghm4OquzroucQxF67ffHfry+7c7CpVNir44uRcCmUje/SpJbzWTZLHB2sIg
	Hk5i7dBfcdBTYS3dSaL5PLVaTs3uPERFPPWCAl6NwaLQwfHCwWQF/iCMhvrPwuRKFxwIKNFFbhdnl
	p1TCA1+5Lmh1cibylx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx1-00000000FeW-48Pa;
	Tue, 25 Feb 2025 16:38:31 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuxs-0000000HNBm-42Gl
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 13:27:14 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcd509468eso2723507eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740490032; x=1741094832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ2IplcBO6Wt9ORsHg89Jo3ShjOFNhdLXDKK/XmSsr8=;
        b=g0Dd1sK3Ne8toYwGkfIcsdXFe+MBeg2eb56ionw3fks15DRIsm0ednULESFGGOAMnt
         YUZ/jdDEMD/PJlG/tnCAl/SuukTOb8mWwpLaLp6J2/xeAewUoNJsothYGot9xvBY/feK
         TeyczamCj+mCaRWPqpGtK+GML0A8zGXxlam53i/T5EZ/FxqMLUmL0LUcztWzycp9ifTo
         6yZpO9+d8Svb/wQpGM60CAxzlQ2YPAxnVQvAKs77E6+pvRIXDmm/pNFXUpVyWDE0MgOd
         MeAHf57N83BK1LM8rPsxOAQcPExpqIpntxGvk15caWs5HzXfN91IACcOwqOdEw/NuRfv
         /LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490032; x=1741094832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ2IplcBO6Wt9ORsHg89Jo3ShjOFNhdLXDKK/XmSsr8=;
        b=i6+OQBv/V9hprNRJVCKrq7aNEEPEdOnJrKLRAEMa07lvTuVEOnhDH5PeYIHwYRmcTf
         L3Y/EEBVSj2XNqkpOxfICSN+LhF3fj7c/kQ7E/jr+uOqtL8uCYIuNkVGuBiLtr74oUFr
         N4Vcujn2fTSBlGNDxRuCei2YVIIuxTRVzRFJukshOOTMgNp+tVwLh1+kw0+GwkCUXD94
         q+ciGaZpdSUDytrHEzcATLLQ3c7SJjlvbVQcLkZFF65x4SnM9gR71+zld6h+4JLlvZAH
         cl5xINS+T/RximB36kwjLIs5fz2km/b1N/rxZqILK2BWI9MWGNWF0Y8qDevZurspLciI
         VGvw==
X-Forwarded-Encrypted: i=1; AJvYcCWTOv+iSXYao8NsvduPrL2YII5C5xSUxsCC9RhN7UFVE9NjKZV59dHnnFS/BQ0yW9kw+xoQBTtPQwNCcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFKWeFls7sIaEYmBsLtkFo0egrS1hYrhMMNuh8qR06SI4TQIlr
	n/TBFXKG7qJszBeIOMXpCHV+pUDLoylcMurGxWw9w7eLU+tA3Jqvp5UJaFnCfVdc+x8/CfVMHni
	PCuu2+H5x/7EW1bRiu1RE6gmvJ/IvHbb2xD1i9w==
X-Gm-Gg: ASbGnctd0cku/kN+7MDr5wGcqJrCjmyQ5b07Ov3KhAgU7Y+sf5/8gDYQckWEiWqls0u
	M+/qiQi2JSjNqAkV2K1PTUdsVtrIS3YVf/o7YNv8qvxhbjJGDBmhaEdU7HFRlWapmSiuVA4L2Kp
	svDO0CL/Jmag==
X-Google-Smtp-Source: AGHT+IGCYFeFsD7WGV356badMoylqjRk/7L+ck4H3fwlwJNvLiJ10J44Ay/xWN6OXmGF8Zq2ohZYK5fZI2twS/y+Qxs=
X-Received: by 2002:a05:6808:3a06:b0:3f4:1738:f804 with SMTP id
 5614622812f47-3f425a5a053mr14822684b6e.4.1740490031753; Tue, 25 Feb 2025
 05:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com> <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
In-Reply-To: <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 25 Feb 2025 21:27:00 +0800
X-Gm-Features: AWEUYZnBrHwWk1-NR_0_zzRZ-hclxJae0XrHpGmrq4kc_cdvQEhDUpQ2xjlpHLE
Message-ID: <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_052713_040687_8CE3A3FE 
X-CRM114-Status: GOOD (  21.16  )
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

SGkgQWxleCwKCk9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDk6MjHigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4gT24g
V2VkLCBKYW4gMTUsIDIwMjUgYXQgMzo0MOKAr0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiB2MS92MjoKPiA+IFRoZXJlIGlzIG9ubHkgdGhlIGZp
cnN0IHBhdGNoOiBSSVNDLVY6IEVuYWJsZSBjYm8uY2xlYW4vZmx1c2ggaW4gdXNlcm1vZGUsCj4g
PiB3aGljaCBtYWlubHkgcmVtb3ZlcyB0aGUgZW5hYmxpbmcgb2YgY2JvLmludmFsIGluIHVzZXIg
bW9kZS4KPiA+Cj4gPiB2MzoKPiA+IEFkZCB0aGUgZnVuY3Rpb25hbGl0eSBvZiBFeHBvc2UgWmlj
Ym9tIGFuZCBzZWxmdGVzdHMgZm9yIFppY2JvbS4KPiA+Cj4gPiB2NDoKPiA+IE1vZGlmeSB0aGUg
b3JkZXIgb2YgbWFjcm9zLCBUaGUgdGVzdF9ub19jYm9faW52YWwgZnVuY3Rpb24gaXMgYWRkZWQK
PiA+IHNlcGFyYXRlbHkuCj4gPgo+ID4gdjU6Cj4gPiAxLiBNb2RpZnkgdGhlIG9yZGVyIG9mIFJJ
U0NWX0hXUFJPQkVfS0VZX1pJQ0JPTV9CTE9DS19TSVpFIGluIGh3cHJvYmUucnN0Cj4gPiAyLiAi
VEVTVF9OT19aSUNCT0lOVkFMIiAtPiAiVEVTVF9OT19DQk9fSU5WQUwiCj4gPgo+ID4gWXVuaHVp
IEN1aSAoMyk6Cj4gPiAgIFJJU0MtVjogRW5hYmxlIGNiby5jbGVhbi9mbHVzaCBpbiB1c2VybW9k
ZQo+ID4gICBSSVNDLVY6IGh3cHJvYmU6IEV4cG9zZSBaaWNib20gZXh0ZW5zaW9uIGFuZCBpdHMg
YmxvY2sgc2l6ZQo+ID4gICBSSVNDLVY6IHNlbGZ0ZXN0czogQWRkIFRFU1RfWklDQk9NIGludG8g
Q0JPIHRlc3RzCj4gPgo+ID4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAg
ICAgICAgfCAgNiArKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oICAgICAg
ICAgICAgfCAgMiArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
ICAgICAgfCAgMiArCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAg
ICAgICB8ICA4ICsrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAg
ICAgICAgfCAgNiArKwo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUv
Y2JvLmMgfCA2NiArKysrKysrKysrKysrKysrKy0tLS0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDc4
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjM5LjIKPiA+
Cj4KPiBTbyBhIHY2IG5lZWRzIHRvIGJlIHNlbnQgd2l0aDoKPgo+IC0gdGhlIGZpeCBmb3IgaHdw
cm9iZV9leHQwX2hhcygpIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90Cj4gLSBhIHJlYmFz
ZSBvbiB0b3Agb2YgNi4xNCBzaW5jZSBwYXRjaCAyIHdpbGwgY29uZmxpY3Qgd2l0aAo+IFJJU0NW
X0hXUFJPQkVfS0VZX1ZFTkRPUl9FWFRfVEhFQURfMAoKVGhhbmsgeW91IGZvciB0aGUgcmVtaW5k
ZXIuIEluIGZhY3QsIHZlcnNpb24gNiB3YXMgc2VudCBvdXQgYWxtb3N0IGEKbW9udGggYWdvLiBS
ZWZlcmVuY2U6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTAxMjQwMzU5NTkuNDU0
OTktMS1jdWl5dW5odWlAYnl0ZWRhbmNlLmNvbS8KCj4KPiBEbyB5b3UgdGhpbmsgeW91IGNhbiBk
byB0aGF0IHNvb24gc28gdGhhdCBpdCBnZXRzIG1lcmdlZCBpbiA2LjE1PyBUaGUKPiBwYXRjaHNl
dCByZWNlaXZlZCBhIGxvdCBvZiBSQiBzbyBpdCB3b3VsZCBiZSB0b28gYmFkIHRvIG1pc3MgdGhp
cwo+IHJlbGVhc2UuCj4KPiBUaGFua3MsCj4KPiBBbGV4CgpUaGFua3MsCll1bmh1aQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
