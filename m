Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA128C4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jznNg06NHyc8njrE1BuUnJNte5X3kuJsTuNY4Yf82Zo=; b=loTZmjbpPUtKoL
	a9pTMEONYaIe2iIKbP18hmmDCQ03fy56FbSU+MhQRIk7Yw34soP9jgTCtIi6aRRycPc9SqOl5UyEJ
	wK6umP1iFYIqVuhDSgiwei1ml5QQc/c07Ki3A4mqhaHLjyX68ZwjyS1WFYwnc/QquyPLNmt32pkWr
	yQqfBuyTcEBx7FHuSOm/bN7G21BaB6N1XRPg9YZTWZzKWp/ZBDvB6oAFnmRPR+18ORJE6092hf01L
	v4X94OHe/bN0hGker1hBG1brLK56gVA04B/PRMYcaFiuOxwKwVIvX+v3Zqjen1hdPV5j1MlH6eRif
	U6c2AiP733uWdZYUFCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHag-0000000Gfzr-1UNI;
	Sat, 03 Feb 2024 15:05:58 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHac-0000000GfzA-45Et;
	Sat, 03 Feb 2024 15:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706972755; x=1738508755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ELEZEWWk9NQcZeuQTjNOf8Xawd967PBWJKiK7K14SIs=;
  b=EzWPjFexXjO0RYoU1kG7+yYnwaZN9PS1LU2TVF+DkgWRryDZj6IyrdW8
   HoQoKmlpkIRCk6XkM0uf5TpEEPA56NOoSxVj/2S7ucW6xgK68BppRegAo
   xqmYw19fnYCGVzSR3glk2LUbcr6B3um7+Auuk87byyjOemXe4cCAOJBUE
   dfNwZ7CgZ2yCodDLgC7GlWW8PXc+COWp18qCXZCVg80oHAoypCBnWnBqo
   V/HFcIJVUpvVwnDJYCpQSn8BvlamAHcOmuaWwYyc7ACvNXautBzGYrnib
   cPNsV6m4Xwf3o8P8dby/VjGrRsWdfx1u4r5Y3Tdud44qSlozKxURTFSEy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="555427"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="555427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 07:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="23607836"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2024 07:05:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWHaS-0005DA-0N;
	Sat, 03 Feb 2024 15:05:44 +0000
Date: Sat, 3 Feb 2024 23:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
Message-ID: <202402032222.BiIrD3g4-lkp@intel.com>
References: <20240131125920.2879433-3-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131125920.2879433-3-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_070555_085153_48171EE0 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev, John Watts <contact@jookia.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, oe-kbuild-all@lists.linux.dev, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Brandon Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxla3NhbmRyLAoKa2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1
aWxkIHdhcm5pbmdzOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHJvYmgvZm9yLW5leHRd
ClthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBzdW54aS9zdW54aS9mb3ItbmV4dCBsaW51cy9t
YXN0ZXIgdjYuOC1yYzIgbmV4dC0yMDI0MDIwMl0KW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0
byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4KQW5kIHdoZW4gc3Vi
bWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZCBp
bgpodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCNfYmFzZV90cmVlX2lu
Zm9ybWF0aW9uXQoKdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51
eC9jb21taXRzL0FsZWtzYW5kci1TaHViaW4vZHQtYmluZGluZ3MtcHdtLUFkZC1iaW5kaW5nLWZv
ci1BbGx3aW5uZXItRDEtVDExMy1TMy1SMzI5LVBXTS1jb250cm9sbGVyLzIwMjQwMTMxLTIxMDMx
MwpiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3JvYmgvbGludXguZ2l0IGZvci1uZXh0CnBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNDAxMzExMjU5MjAuMjg3OTQzMy0zLXByaXZhdGVzdWIyJTQwZ21haWwuY29t
CnBhdGNoIHN1YmplY3Q6IFtQQVRDSCB2OCAyLzNdIHB3bTogQWRkIEFsbHdpbm5lcidzIEQxL1Qx
MTMtUzMvUjMyOSBTb0NzIFBXTSBzdXBwb3J0CmNvbmZpZzogeDg2XzY0LWFsbHllc2NvbmZpZyAo
aHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwMjAzLzIwMjQwMjAz
MjIyMi5CaUlyRDNnNC1sa3BAaW50ZWwuY29tL2NvbmZpZykKY29tcGlsZXI6IGNsYW5nIHZlcnNp
b24gMTcuMC42IChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgNjAwOTcwOGI0
MzY3MTcxY2NkYmY0YjU5MDVjYjZhODAzNzUzZmUxOCkKcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0x
IGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI0MDIw
My8yMDI0MDIwMzIyMjIuQmlJckQzZzQtbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCgpJZiB5b3Ug
Zml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBh
IG5ldyB2ZXJzaW9uIG9mCnRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93
aW5nIHRhZ3MKfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
CnwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwMjAz
MjIyMi5CaUlyRDNnNC1sa3BAaW50ZWwuY29tLwoKQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVm
aXhlZCBieSA+Pik6Cgo+PiBkcml2ZXJzL3B3bS9wd20tc3VuMjBpLmM6NDc6IHdhcm5pbmc6IFRo
aXMgY29tbWVudCBzdGFydHMgd2l0aCAnLyoqJywgYnV0IGlzbid0IGEga2VybmVsLWRvYyBjb21t
ZW50LiBSZWZlciBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS9rZXJuZWwtZG9jLnJzdAogICAgKiBT
VU4yMElfUFdNX01BR0lDIGlzIHVzZWQgdG8gcXVpY2tseSBjb21wdXRlIHRoZSB2YWx1ZXMgb2Yg
dGhlIGNsb2NrIGRpdmlkZXJzCgoKdmltICs0NyBkcml2ZXJzL3B3bS9wd20tc3VuMjBpLmMKCiAg
ICA0NQkKICAgIDQ2CS8qKgogID4gNDcJICogU1VOMjBJX1BXTV9NQUdJQyBpcyB1c2VkIHRvIHF1
aWNrbHkgY29tcHV0ZSB0aGUgdmFsdWVzIG9mIHRoZSBjbG9jayBkaXZpZGVycwogICAgNDgJICog
ZGl2X20gKFNVTjIwSV9QV01fQ0xLX0NGR19ESVZfTSkgJiBwcmVzY2FsZV9rIChTVU4yMElfUFdN
X0NUTF9QUkVTQ0FMX0spCiAgICA0OQkgKiB3aXRob3V0IHVzaW5nIGEgbG9vcC4gVGhlc2UgZGl2
aWRlcnMgbGltaXQgdGhlICMgb2YgY3ljbGVzIGluIGEgcGVyaW9kCiAgICA1MAkgKiB0byBTVU4y
MElfUFdNX1BDTlRSX1NJWkUgYnkgYXBwbHlpbmcgYSBzY2FsaW5nIGZhY3RvciBvZgogICAgNTEJ
ICogMS8oZGl2X20gKiAocHJlc2NhbGVfayArIDEpKSB0byB0aGUgY2xvY2sgc291cmNlLgogICAg
NTIJICoKICAgIDUzCSAqIFNVTjIwSV9QV01fTUFHSUMgaXMgZGVyaXZlZCBieSBzb2x2aW5nIGZv
ciBkaXZfbSBhbmQgcHJlc2NhbGVfawogICAgNTQJICogc3VjaCB0aGF0IGZvciBhIGdpdmVuIHJl
cXVlc3RlZCBwZXJpb2QsCiAgICA1NQkgKgogICAgNTYJICogaSkgZGl2X20gaXMgbWluaW1pemVk
IGZvciBhbnkgcHJlc2NhbGVfayDiiaQgU1VOMjBJX1BXTV9DVExfUFJFU0NBTF9LX01BWCwKICAg
IDU3CSAqIGlpKSBwcmVzY2FsZV9rIGlzIG1pbmltaXplZC4KICAgIDU4CSAqCiAgICA1OQkgKiBU
aGUgZGVyaXZhdGlvbiBwcm9jZWVkcyBhcyBmb2xsb3dzLCB3aXRoIHZhbCA9ICMgb2YgY3ljbGVz
IGZvciByZXFlc3RlZAogICAgNjAJICogcGVyaW9kOgogICAgNjEJICoKICAgIDYyCSAqIGZvciBh
IGdpdmVuIHZhbHVlIG9mIGRpdl9tIHdlIHdhbnQgdGhlIHNtYWxsZXN0IHByZXNjYWxlX2sgc3Vj
aCB0aGF0CiAgICA2MwkgKgogICAgNjQJICogKHZhbCA+PiBkaXZfbSkgLy8gKHByZXNjYWxlX2sg
KyAxKSDiiaQgNjU1MzYgKFNVTjIwSV9QV01fUENOVFJfU0laRSkKICAgIDY1CSAqCiAgICA2Ngkg
KiBUaGlzIGlzIGVxdWl2YWxlbnQgdG86CiAgICA2NwkgKgogICAgNjgJICogKHZhbCA+PiBkaXZf
bSkg4omkIDY1NTM2ICogKHByZXNjYWxlX2sgKyAxKSArIHByZXNjYWxlX2sKICAgIDY5CSAqIOKf
uiAodmFsID4+IGRpdl9tKSDiiaQgNjU1MzcgKiBwcmVzY2FsZV9rICsgNjU1MzYKICAgIDcwCSAq
IOKfuiAodmFsID4+IGRpdl9tKSAtIDY1NTM2IOKJpCA2NTUzNyAqIHByZXNjYWxlX2sKICAgIDcx
CSAqIOKfuiAoKHZhbCA+PiBkaXZfbSkgLSA2NTUzNikgLyA2NTUzNyDiiaQgcHJlc2NhbGVfawog
ICAgNzIJICoKICAgIDczCSAqIEFzIHByZXNjYWxlX2sgaXMgaW50ZWdlciwgdGhpcyBiZWNvbWVz
CiAgICA3NAkgKgogICAgNzUJICogKCh2YWwgPj4gZGl2X20pIC0gNjU1MzYpIC8vIDY1NTM3IOKJ
pCBwcmVzY2FsZV9rCiAgICA3NgkgKgogICAgNzcJICogQW5kIGlzIG1pbmltaXplZCBhdAogICAg
NzgJICoKICAgIDc5CSAqICgodmFsID4+IGRpdl9tKSAtIDY1NTM2KSAvLyA2NTUzNwogICAgODAJ
ICoKICAgIDgxCSAqIE5vdyB3ZSBwaWNrIHRoZSBzbWFsbGVzdCBkaXZfbSB0aGF0IHNhdGlmaWVz
IHByZXNjYWxlX2sg4omkIDI1NQogICAgODIJICogKGkuZSBTVU4yMElfUFdNX0NUTF9QUkVTQ0FM
X0tfTUFYKSwKICAgIDgzCSAqCiAgICA4NAkgKiAoKHZhbCA+PiBkaXZfbSkgLSA2NTUzNikgLy8g
NjU1Mzcg4omkIDI1NQogICAgODUJICog4p+6ICh2YWwgPj4gZGl2X20pIC0gNjU1MzYg4omkIDI1
NSAqIDY1NTM3ICsgNjU1MzYKICAgIDg2CSAqIOKfuiB2YWwgPj4gZGl2X20g4omkIDI1NSAqIDY1
NTM3ICsgMiAqIDY1NTM2CiAgICA4NwkgKiDin7ogdmFsID4+IGRpdl9tIDwgKDI1NSAqIDY1NTM3
ICsgMiAqIDY1NTM2ICsgMSkKICAgIDg4CSAqIOKfuiBkaXZfbSA9IGZscygodmFsKSAvICgyNTUg
KiA2NTUzNyArIDIgKiA2NTUzNiArIDEpKQogICAgODkJICoKICAgIDkwCSAqIFN1Z2dlc3RlZCBi
eSBVd2UgS2xlaW5lLUvDtm5pZwogICAgOTEJICovCiAgICA5MgkjZGVmaW5lIFNVTjIwSV9QV01f
TUFHSUMJCQkoMjU1ICogNjU1MzcgKyAyICogNjU1MzYgKyAxKQogICAgOTMJCgotLSAKMC1EQVkg
Q0kgS2VybmVsIFRlc3QgU2VydmljZQpodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3Rz
L3dpa2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
