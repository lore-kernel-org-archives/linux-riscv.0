Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED10DC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 02:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krpGRjvIhA27EI2oCqjaJ411JUAvKaXYrc7/D6A7p70=; b=uWcR5aonLDEjil
	baA6rpSfbUwkibwY44hiDBwY1vfdKPihbKk5w7UbdGiX8oRmoImRZrjzrMGSLiowZrouWQKGlf5Sh
	vVvVnuCaxB8GlbmxRsUZXiFJsjQIScGjv36SlQ7OTOMPsVIa/NtfhcTmfzbqMiO9xu9zqQlhl6DCp
	XZPWgVeoZrouBXwTbWiOb3en6OqULq9LP98f+9QsEdO/cxKiprUtV3uXU1YleNTKQOySiGkgNAods
	CQBKZKOvym8WwuvWoIWW2FFNb2o8Z5TzxIEjJHJpoxECbvacHdfUhBLTh6qGB/Z7cnrqMfmSJRfKo
	KJuZh+AX3GaMzkWWuLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgRE-00000002Kzv-0Zyk;
	Tue, 11 Feb 2025 02:55:52 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1theQh-0000000226k-005x;
	Tue, 11 Feb 2025 00:47:12 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679eacf2c5so51651041cf.0;
        Mon, 10 Feb 2025 16:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739234829; x=1739839629; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
        b=njmx7K13XudtyUI38Ns3JQf660DXAQtrLva4LiHFgTZR327waVH2jKC6iXD+jaY86x
         224OBakHWRdvXkZPm6UtVMaxny3wHPFY9eK/aPuqV4A1zWPNihCj/rLwrx8APPsgPSVB
         fjFlDlB/+CvieP+BNSGdX9JQ35Ge5IwadUZzTvRC9wq7f/Im9Lk6vk17+qgkpw8GUfPp
         KGLbqYXoYZIvYArQyQ6nsrkQm3iuemMfkUIWZlgH4xtU8PGOBWfTiWT06UMPUtqCob54
         55ERwbzA4GlkcteIh9i6XN4O+bF7CnE3AFSqiVOnttjBcfrfyCqdzDCewao8nQpUI4zA
         1GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739234829; x=1739839629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
        b=JOl5LaCL6+BNQBXYQXHEdC0dhPcdu0ppQ43Zuugq7flC6g43j3omU6up0VNjIb67ue
         hkqUfsPtAm0dU/HuwaJVMOMCjgnvbr64n2yr60XGICG7UrPayhM0mwn2FAx56ks8YYhN
         hnkelxtJ2Hepaie3Zqg/mYzkOH3UkSqN7rN6Zt1H748TDWwyCi2h3CnbqCgIsxjbRAYm
         j8zcaGqRLYZ1zlC960xL2wIdEAElqQrawK9Fep/v3Idz7tJERySD6CA+oI6GORLvJc8z
         XRYICIjn5yUp2kXLwujGSDfAYOvXQtHzjUT1M6mnqOKAgT7YGq307J3vDUA1biA7YfDV
         E02A==
X-Forwarded-Encrypted: i=1; AJvYcCXcMlscOwOMVjSXxFU2rz4BmCTg7dmR7bbrCb15Q3DFO3qluwMfnEIH1s6PYClQF/fnOJeLOCByokowWX1ht9xG@lists.infradead.org, AJvYcCXtUOgn++1iu2MHhE3i8FE8x0/pvHRt/ffw25ea8GF0PeQshSfTO46pY0BnefnM9U50LqHaKWe0kFZCh3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqT1ZZaJShYtmKuQL3IbqH8O5uFvsZ5azZuNN2b6IhjBCfVgI
	KvsSOAw6BQ7EXkZ+6PcY8SDjFDsrrFf9MAng9HRBHcc5RFYivwNS
X-Gm-Gg: ASbGncu/b2MFWuvNItkwaNHvoMXRN1YBNUfuJKXTnqGDYCP28TC6pvv0q/tu6GAXft0
	pzRExIgGd57EBMS5OXKiXEboAapSL+8VOLuZhdkdwZSdpZawd03VjYIR9c2m087yaAzx/WtoYWY
	t8L9eeI0u9OMDD7WEZ9OyF3b2VpBwSKBZ0k4l5/e+ZMkwh0mB1J9DEZeKk1FyP6dg3jG1oVkE+c
	ZRcqOxJjHFDN++tVkjI+vmNEuiYcXbTo6o3qILoJAEiv9qJopLhWlTH7F8/0Ne4uuY=
X-Google-Smtp-Source: AGHT+IHdTWiwpRzbdPuvlFEYzABE9ESxasKSuFHVRX5pGBvoEIPULEvUws7kobHnz0ZNoja0v14wbA==
X-Received: by 2002:a05:6214:dc7:b0:6d4:1e43:f3a5 with SMTP id 6a1803df08f44-6e4455f4e38mr268033066d6.13.1739234829280;
        Mon, 10 Feb 2025 16:47:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e459711533sm26289906d6.18.2025.02.10.16.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:47:08 -0800 (PST)
Date: Tue, 11 Feb 2025 08:47:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, 
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Suraj Jaiswal <quic_jsuraj@quicinc.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <uhup3bm6ez6kg7efvimy6rcthmqfcdkg2vmcwafqz33vouplfl@i25wn6q6c4h6>
References: <20250209013054.816580-1-inochiama@gmail.com>
 <20250209013054.816580-4-inochiama@gmail.com>
 <2379380.ElGaqSPkdT@fw-rgant>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2379380.ElGaqSPkdT@fw-rgant>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_164711_042522_280F3955 
X-CRM114-Status: GOOD (  29.46  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTI6MDE6NTZQTSArMDEwMCwgUm9tYWluIEdhbnRvaXMg
d3JvdGU6Cj4gSGVsbG8gSW5vY2hpLAo+IAo+IE9uIGRpbWFuY2hlIDkgZsOpdnJpZXIgMjAyNSAw
MjozMDo1MiBoZXVyZSBub3JtYWxlIGTigJlFdXJvcGUgY2VudHJhbGUgSW5vY2hpIAo+IEFtYW90
byB3cm90ZToKPiA+IEFkZHMgU29waGdvIGR3bWFjIGRyaXZlciBzdXBwb3J0IG9uIHRoZSBTb3Bo
Z28gU0cyMDQ0IFNvQy4KPiAuLi4KPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvcGhnby5jCj4gPiBAQCAtMCwwICsx
LDEwNSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gKy8q
Cj4gPiArICogU29waGdvIERXTUFDIHBsYXRmb3JtIGRyaXZlcgo+ID4gKyAqCj4gPiArICogQ29w
eXJpZ2h0IChDKSAyMDI0IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAr
ICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiAKPiBJdCBkb2Vzbid0IGxv
b2sgbGlrZSB0aGlzIGluY2x1ZGUgaXMgdXNlZCwgY291bGQgeW91IHBsZWFzZSByZW1vdmUgaXQ/
Cj4gCgpUaGFua3MsIEkgd2lsbC4gQW5kIEkgd2lsbCBhZGQgdGhlIG1pc3MgaGVhZGVyIApsaW51
eC9jbGsuaCBhbmQgbGludXgvbW9kdWxlLmguCgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2
aWNldGFibGUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGh5Lmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlICJzdG1tYWNfcGxhdGZv
cm0uaCIKPiA+ICsKPiA+ICtzdHJ1Y3Qgc29waGdvX2R3bWFjIHsKPiA+ICsJc3RydWN0IGRldmlj
ZSAqZGV2Owo+ID4gKwlzdHJ1Y3QgY2xrICpjbGtfdHg7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0
aWMgdm9pZCBzb3BoZ29fZHdtYWNfZml4X21hY19zcGVlZCh2b2lkICpwcml2LCB1bnNpZ25lZCBp
bnQgc3BlZWQsCj4gPiB1bnNpZ25lZCBpbnQgbW9kZSkgK3sKPiA+ICsJc3RydWN0IHNvcGhnb19k
d21hYyAqZHdtYWMgPSBwcml2Owo+ID4gKwlsb25nIHJhdGU7Cj4gPiArCWludCByZXQ7Cj4gPiAr
Cj4gPiArCXJhdGUgPSByZ21paV9jbG9jayhzcGVlZCk7Cj4gPiArCWlmIChyYXRlIDwgMCkgewo+
ID4gKwkJZGV2X2Vycihkd21hYy0+ZGV2LCAiaW52YWxpZCBzcGVlZCAldVxuIiwgc3BlZWQpOwo+
ID4gKwkJcmV0dXJuOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldCA9IGNsa19zZXRfcmF0ZShkd21h
Yy0+Y2xrX3R4LCByYXRlKTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCWRldl9lcnIoZHdtYWMtPmRl
diwgImZhaWxlZCB0byBzZXQgdHggcmF0ZSAlbHU6ICVwZVxuIiwKPiAKPiBuaXQ6IHNob3VsZG4n
dCB0aGlzIGJlICIlbGQiPwo+IAoKWWVhaCwgaXQgaXMgbXkgbWlzdGFrZSwgSSB3aWxsIGZpeCBp
dC4KCj4gPiArCQkJcmF0ZSwgRVJSX1BUUihyZXQpKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGlj
IGludCBzb3BoZ29fc2cyMDQ0X2R3bWFjX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diwKPiA+ICsJCQkJICAgIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQsCj4g
PiArCQkJCSAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyAqc3RtbWFjX3JlcykKPiA+ICt7Cj4g
PiArCXN0cnVjdCBzb3BoZ29fZHdtYWMgKmR3bWFjOwo+ID4gKwo+ID4gKwlkd21hYyA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmR3bWFjKSwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlm
ICghZHdtYWMpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsJZHdtYWMtPmNsa190
eCA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsICJ0eCIpOwo+ID4gKwlpZiAoSVNf
RVJSKGR3bWFjLT5jbGtfdHgpKQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRl
diwgUFRSX0VSUihkd21hYy0+Y2xrX3R4KSwKPiA+ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCB0
eCBjbG9ja1xuIik7Cj4gPiArCj4gPiArCWR3bWFjLT5kZXYgPSAmcGRldi0+ZGV2Owo+ID4gKwlw
bGF0X2RhdC0+YnNwX3ByaXYgPSBkd21hYzsKPiA+ICsJcGxhdF9kYXQtPmZsYWdzIHw9IFNUTU1B
Q19GTEFHX1NQSF9ESVNBQkxFOwo+ID4gKwlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IHNvcGhn
b19kd21hY19maXhfbWFjX3NwZWVkOwo+ID4gKwlwbGF0X2RhdC0+bXVsdGljYXN0X2ZpbHRlcl9i
aW5zID0gMDsKPiA+ICsJcGxhdF9kYXQtPnVuaWNhc3RfZmlsdGVyX2VudHJpZXMgPSAxOwo+ID4g
Kwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBzb3BoZ29fZHdt
YWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArCXN0cnVj
dCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiArCXN0cnVjdCBzdG1tYWNfcmVz
b3VyY2VzIHN0bW1hY19yZXM7Cj4gCj4gbml0OiBJIHRoaW5rIGFkZGluZyAic3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsiIGhlcmUgd291bGQKPiBiZSBiZXR0ZXIgdGhhbiByZXBlYXRp
bmcgIiZwZGV2LT5kZXYiIGxhdGVyIG9uLgo+IAoKVGhhbmtzLCBJIHdpbGwgY2hhbmdlIHRoYXQu
Cgo+ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBzdG1tYWNfZ2V0X3BsYXRmb3JtX3Jl
c291cmNlcyhwZGV2LCAmc3RtbWFjX3Jlcyk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsCj4gPiArCQkJCSAgICAgImZhaWxlZCB0byBn
ZXQgcmVzb3VyY2VzXG4iKTsKPiAKPiBUaGlzIGVycm9yIG1lc3NhZ2UgaXMgYSBiaXQgdG9vIHZh
Z3VlLCBtYXliZSByZXBsYWNlIGl0IHdpdGggImZhaWxlZCB0byBnZXQgCj4gcGxhdGZvcm0gcmVz
b3VyY2VzIj8KPiAKCk9LLgoKPiA+ICsKPiA+ICsJcGxhdF9kYXQgPSBkZXZtX3N0bW1hY19wcm9i
ZV9jb25maWdfZHQocGRldiwgc3RtbWFjX3Jlcy5tYWMpOwo+ID4gKwlpZiAoSVNfRVJSKHBsYXRf
ZGF0KSkKPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocGxh
dF9kYXQpLAo+ID4gKwkJCQkgICAgICJkdCBjb25maWd1cmF0aW9uIGZhaWxlZFxuIik7Cj4gCj4g
VGhpcyBlcnJvciBtZXNzYWdlIGlzIGEgYml0IG1pc2xlYWRpbmcgSU1PLCBJIHdvdWxkIHJlcGxh
Y2UgaXQgd2l0aAo+IHNvbWV0aGluZyBsaWtlICJmYWlsZWQgdG8gcGFyc2UgZGV2aWNlLXRyZWUg
cGFyYW1ldGVycyIuCj4gCgpPSy4KCj4gPiArCj4gPiArCXJldCA9IHNvcGhnb19zZzIwNDRfZHdt
YWNfaW5pdChwZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMpOwo+ID4gKwlpZiAocmV0KQo+ID4g
KwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJcmV0dXJuIHN0bW1hY19kdnJfcHJvYmUoJnBkZXYt
PmRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc29waGdvX2R3bWFjX21hdGNoW10gPSB7Cj4gPiArCXsg
LmNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0NC1kd21hYyIgfSwKPiA+ICsJeyAvKiBzZW50aW5l
bCAqLyB9Cj4gPiArfTsKPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzb3BoZ29fZHdtYWNf
bWF0Y2gpOwo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNvcGhnb19k
d21hY19kcml2ZXIgPSB7Cj4gPiArCS5wcm9iZSAgPSBzb3BoZ29fZHdtYWNfcHJvYmUsCj4gPiAr
CS5yZW1vdmUgPSBzdG1tYWNfcGx0ZnJfcmVtb3ZlLAo+ID4gKwkuZHJpdmVyID0gewo+ID4gKwkJ
Lm5hbWUgPSAic29waGdvLWR3bWFjIiwKPiA+ICsJCS5wbSA9ICZzdG1tYWNfcGx0ZnJfcG1fb3Bz
LAo+ID4gKwkJLm9mX21hdGNoX3RhYmxlID0gc29waGdvX2R3bWFjX21hdGNoLAo+ID4gKwl9LAo+
ID4gK307Cj4gPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzb3BoZ29fZHdtYWNfZHJpdmVyKTsK
PiA+ICsKPiA+ICtNT0RVTEVfQVVUSE9SKCJJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwu
Y29tPiIpOwo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiU29waGdvIERXTUFDIHBsYXRmb3JtIGRy
aXZlciIpOwo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiAKPiBUaGFua3MsCj4gCj4gLS0g
Cj4gUm9tYWluIEdhbnRvaXMsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
