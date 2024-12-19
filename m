Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C12CE7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39q+npqk+AawRuNYCkGibvhqZteTmw91oCQdWePQ0qE=; b=QwImedyLllZP6z
	ZvNXLHV++YXXcLV4QQiXweY08Cz9mhyDqfnt6O58NXL0bKgcc+0IPSNSiX5qymBXje0Z5iGLd14cM
	LhRV8D/6kIuhwKr/R1FFmWC06RgOCNEoTygwVtNmNIJGoj927QyK0/XWwcCIXoshaMXy0Et8NrhjC
	sCuuGlAHOuB4UX9Mhol4oEFDxbybt6EX3BIG22bm1JAFW6b1KgXl54H+GHHeQjKSL3ynXe0akMrUE
	xNGA5DMieNbKDLwKNqFNbNYcrP79/GWKEIUiNd+d+TaSz2TS0BdX54a0mdjNNEjvx2ci4Mnrp2ny1
	echkeC5JKwXUkjjYdR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAGC-00000000ztF-2ZKy;
	Thu, 19 Dec 2024 06:43:48 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAGA-00000000zsp-0rNh
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 06:43:47 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3eb9de518e2so191598b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 22:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734590624; x=1735195424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAyaflWjJ61cMlTmtaMmaqd+NucxVwjWIn4v9/Kh7lo=;
        b=JVM1oztHNP7bUKqjpBnjb2KDEZ5DNtKFO5l5VDhBbbwsLNxZchZj7jffvLbz2YS92t
         1Twb5Hcohm/18ec3AnamrEpe3y/SIlBZnGc1G+mrE0a6dydKzZgIVZGSDf0Pv9n9sGLC
         AVl4nproe1yBVbE252yPZGXK1QYtPci9LC4ijekeDXou/iq+9ppgeJzHf7kkoNP/hJRn
         ZITpdF6xqSP9kDbp6HivcHrYHKs5Ap0wxofGJ2mMCESXZ9qZ5OeEFFbF7yY3cxjiGdQn
         axta5kewl1EQDNIPvLx/AmDhoocdQEMGuyqssD5NRHq3o+Uq6Vzf81hcHOtO/TZF04hN
         lx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734590624; x=1735195424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAyaflWjJ61cMlTmtaMmaqd+NucxVwjWIn4v9/Kh7lo=;
        b=dOL/D/Ac76IoMppConGiRCON8d/Pwwpp8IRDOYFDJqC2x0NQYJp5/xhhlN3iizBuE4
         MzTi/2eauI7Hk0v/KGHOncI0vxBWttNo9Is26XWX4puyHPJ3PYoeADMGWRxpBzMnWOI4
         mBa3SWdmJ9MCDOO8PSHl6hq9ATR667SOgDNA1TLJhkoIHplQiThzHOUXnmfPwaOrdmZc
         mv1T+qE867yK3vwbj62W6qta3eI98dM3tTxH1WSODtJn/9rzI7CvBD+Sm5gr9vsJSGcT
         Qv8BQfrwNXL6HReNSlcFugN/ONasa20o6tFJU/jdRYnMt8HH8VUGaruD5t4SCSYJTKX2
         ln6A==
X-Forwarded-Encrypted: i=1; AJvYcCXqDnmNY0aEQW9pdmrTRYWCgIi2MdOXOtJ8DPW3IArDkfYPjzZ+vvdaq84gnN8ymCtJT07R6HraKMK6MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEjTC2Z7rusaDbuChXeAVqvLVYsrSgT59XYSZdzmsrsxXX72Vt
	rK87j3i81VjxnDCXlbQsf79g26FjEJMUToG9Zdb2SfNU5jbpkx3agn2GweMNh+dfYqNv1LXYh5U
	uQyBOMNBkpiA02/LCkwvcRK9/TI1KkdO2/j2fig==
X-Gm-Gg: ASbGncuTk3o8hyXW8ju9+dU8jAplIrj9D0Cmrb7tjyAwNAyxSmuZxlU1Tj/FdqR1UMF
	ytIRv/RKLSNFRwJ3hkNHRkBtH/o57UWro1uAHzztP
X-Google-Smtp-Source: AGHT+IGScwcpVBoct0MJSLL2f6zfiMP4c6iedjLpgVlNxVO6f+KRkxQ/I9O1/E3g94YAL2EUDbfA9TZCARidrHSbTdA=
X-Received: by 2002:a05:6808:1815:b0:3eb:4681:a895 with SMTP id
 5614622812f47-3eccbf08d22mr3746892b6e.7.1734590624483; Wed, 18 Dec 2024
 22:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20241210142353.6457-1-yongxuan.wang@sifive.com>
 <20241210142353.6457-3-yongxuan.wang@sifive.com> <CAFTtA3NTcHAm4YRMQr5N8TkQnLS5tXhw7LihiR8=9D+3HXT7Gg@mail.gmail.com>
In-Reply-To: <CAFTtA3NTcHAm4YRMQr5N8TkQnLS5tXhw7LihiR8=9D+3HXT7Gg@mail.gmail.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 19 Dec 2024 14:43:32 +0800
Message-ID: <CAMWQL2j6grQg8E0SCsHcWgocBMgWhe=UuwZESr5xu2dwszqqeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: signal: fix signal_minsigstksz
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_224346_266484_E7D1DBE7 
X-CRM114-Status: GOOD (  29.00  )
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

SGkgQW5keSwKCk9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDEyOjE34oCvQU0gQW5keSBDaGl1IDxh
bmR5Ym5hY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgWW9uZy1YdWFuLAo+Cj4gWW9uZy1YdWFu
IFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4g5pa8IDIwMjTlubQxMuaciDEw5pelIOmA
seS6jCDkuIvljYgxMDoyNOWvq+mBk++8mgo+ID4KPiA+IFRoZSBpbml0X3J0X3NpZ25hbF9lbnYo
KSBmdW5jaXRvbiBpcyBjYWxsZWQgYmVmb3JlIHRoZSBhbHRlcm5hdGl2ZSBwYXRjaAo+ID4gaXMg
YXBwbGllZCwgc28gdXNpbmcgdGhlIGFsdGVybmF0aXZlLXJlbGF0ZWQgQVBJIHRvIGNoZWNrIHRo
ZSBhdmFpbGFiaWxpdHkKPiA+IG9mIGFuIGV4dGVuc2lvbiB3aXRoaW4gdGhpcyBmdW5jdGlvbiBk
b2Vzbid0IGhhdmUgdGhlIGludGVuZGVkIGVmZmVjdC4KPiA+IEluc3RlYWQsIHRoZSByaXNjdl9p
c2EgYml0bWFwIHNob3VsZCBiZSB1c2VkIHRvIHByb3Blcmx5IGNoZWNrIHdoZXRoZXIKPiA+IGdp
dmVuIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUuIFRoaXMgcGF0Y2ggYWxzbyByZWZhY3RvcnMgdGhl
IGVzdGltYXRpb24gb2YKPiA+IHNpZ25hbF9taW5zaWdzdGtzeiBieSBleHRyYWN0aW5nIGl0IGZy
b20gdGhlIGdldF9ydF9mcmFtZV9zaXplKCkgZnVuY2l0b24uCj4gPgo+ID4gRml4ZXM6IGU5MmY0
NjliMDc3MSAoInJpc2N2OiBzaWduYWw6IFJlcG9ydCBzaWduYWwgZnJhbWUgc2l6ZSB0byB1c2Vy
c3BhY2UgdmlhIGF1eHYiKQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4
dWFuLndhbmdAc2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNp
Zml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyB8IDQwICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCj4g
PiBpbmRleCBjM2M1MTdiOWVlZTUuLjg1ZWFjODQ3MTllOSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3NpZ25hbC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwu
Ywo+ID4gQEAgLTIwMywyMiArMjAzLDE4IEBAIHN0YXRpYyBsb25nIHJlc3RvcmVfc2lnY29udGV4
dChzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiA+ICAgICAgICAgcmV0dXJuIGVycjsKPiA+ICB9Cj4g
Pgo+ID4gLXN0YXRpYyBzaXplX3QgZ2V0X3J0X2ZyYW1lX3NpemUoYm9vbCBjYWxfYWxsKQo+ID4g
K3N0YXRpYyBzaXplX3QgZ2V0X3J0X2ZyYW1lX3NpemUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiAgewo+ID4gICAgICAgICBzdHJ1Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFtZTsKPiA+IC0g
ICAgICAgc2l6ZV90IGZyYW1lX3NpemU7Cj4gPiArICAgICAgIHNpemVfdCBmcmFtZV9zaXplID0g
c2l6ZW9mKCpmcmFtZSk7Cj4gPiAgICAgICAgIHNpemVfdCB0b3RhbF9jb250ZXh0X3NpemUgPSAw
Owo+ID4KPiA+IC0gICAgICAgZnJhbWVfc2l6ZSA9IHNpemVvZigqZnJhbWUpOwo+ID4gLQo+ID4g
LSAgICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gPiAtICAgICAgICAgICAgICAgaWYgKGNhbF9h
bGwgfHwgcmlzY3Zfdl92c3RhdGVfcXVlcnkodGFza19wdF9yZWdzKGN1cnJlbnQpKSkKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHRvdGFsX2NvbnRleHRfc2l6ZSArPSByaXNjdl92X3NjX3Np
emU7Cj4gPiAtICAgICAgIH0KPiA+ICsgICAgICAgaWYgKGhhc192ZWN0b3IoKSAmJiByaXNjdl92
X3ZzdGF0ZV9xdWVyeShyZWdzKSkKPiA+ICsgICAgICAgICAgICAgICB0b3RhbF9jb250ZXh0X3Np
emUgKz0gcmlzY3Zfdl9zY19zaXplOwo+ID4KPiA+ICAgICAgICAgZnJhbWVfc2l6ZSArPSB0b3Rh
bF9jb250ZXh0X3NpemU7Cj4gPiAtCj4gPiAgICAgICAgIGZyYW1lX3NpemUgPSByb3VuZF91cChm
cmFtZV9zaXplLCAxNik7Cj4gPiArCj4gPiAgICAgICAgIHJldHVybiBmcmFtZV9zaXplOwo+ID4g
IH0KPiA+Cj4gPiBAQCAtMjI4LDcgKzIyNCw3IEBAIFNZU0NBTExfREVGSU5FMChydF9zaWdyZXR1
cm4pCj4gPiAgICAgICAgIHN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwo+ID4gICAg
ICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2s7Cj4gPiAgICAgICAgIHNpZ3NldF90IHNldDsK
PiA+IC0gICAgICAgc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6ZShmYWxzZSk7
Cj4gPiArICAgICAgIHNpemVfdCBmcmFtZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUocmVncyk7
Cj4gPgo+ID4gICAgICAgICAvKiBBbHdheXMgbWFrZSBhbnkgcGVuZGluZyByZXN0YXJ0ZWQgc3lz
dGVtIGNhbGxzIHJldHVybiAtRUlOVFIgKi8KPiA+ICAgICAgICAgY3VycmVudC0+cmVzdGFydF9i
bG9jay5mbiA9IGRvX25vX3Jlc3RhcnRfc3lzY2FsbDsKPiA+IEBAIC0zMTgsNyArMzE0LDcgQEAg
c3RhdGljIGludCBzZXR1cF9ydF9mcmFtZShzdHJ1Y3Qga3NpZ25hbCAqa3NpZywgc2lnc2V0X3Qg
KnNldCwKPiA+ICAgICAgICAgc3RydWN0IHJ0X3NpZ2ZyYW1lIF9fdXNlciAqZnJhbWU7Cj4gPiAg
ICAgICAgIGxvbmcgZXJyID0gMDsKPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBfX21heWJlX3Vu
dXNlZCBhZGRyOwo+ID4gLSAgICAgICBzaXplX3QgZnJhbWVfc2l6ZSA9IGdldF9ydF9mcmFtZV9z
aXplKGZhbHNlKTsKPiA+ICsgICAgICAgc2l6ZV90IGZyYW1lX3NpemUgPSBnZXRfcnRfZnJhbWVf
c2l6ZShyZWdzKTsKPiA+Cj4gPiAgICAgICAgIGZyYW1lID0gZ2V0X3NpZ2ZyYW1lKGtzaWcsIHJl
Z3MsIGZyYW1lX3NpemUpOwo+ID4gICAgICAgICBpZiAoIWFjY2Vzc19vayhmcmFtZSwgZnJhbWVf
c2l6ZSkpCj4gPiBAQCAtNDY1LDE5ICs0NjEsMzMgQEAgdm9pZCBhcmNoX2RvX3NpZ25hbF9vcl9y
ZXN0YXJ0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gIHZvaWQgaW5pdF9ydF9zaWduYWxfZW52
KHZvaWQpOwo+ID4gIHZvaWQgX19pbml0IGluaXRfcnRfc2lnbmFsX2Vudih2b2lkKQo+ID4gIHsK
PiA+IC0gICAgICAgcmlzY3Zfdl9zY19zaXplID0gc2l6ZW9mKHN0cnVjdCBfX3Jpc2N2X2N0eF9o
ZHIpICsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBfX3NjX3Jp
c2N2X3Zfc3RhdGUpICsgcmlzY3Zfdl92c2l6ZTsKPiA+ICsgICAgICAgc3RydWN0IHJ0X3NpZ2Zy
YW1lIF9fdXNlciAqZnJhbWU7Cj4gPiArICAgICAgIHNpemVfdCBmcmFtZV9zaXplID0gc2l6ZW9m
KCpmcmFtZSk7Cj4gPiArCj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIGluaXRfcnRfc2ln
bmFsX2VudigpIGlzIGNhbGxlZCBiZWZvcmUgYXBwbHlpbmcgYWx0ZXJuYXRpdmUgcGF0Y2guIERv
IG5vdCB1c2UKPiA+ICsgICAgICAgICogX19yaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseSgpL19f
cmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseSgpIHRvIGNoZWNrIHRoZQo+ID4gKyAgICAgICAg
KiBhdmFpbGlhYmxpdHkgb2YgYW4gZXh0ZW5zaW9uIGluIHRoaXMgZnVuY3Rpb24uCj4gPiArICAg
ICAgICAqLwo+ID4gKyAgICAgICBpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShO
VUxMLCBSSVNDVl9JU0FfRVhUX3YpKSB7Cj4KPiBUaGlzIHNob3VsZCBhbHNvIGNoZWNrIGZvciBJ
U19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfVikuIEFub3RoZXIgd2F5Cj4gdG8gZG8gdGhpcyBp
cyB0byBjYWxsIGluaXRfcnRfc2lnbmFsX2VudigpIGFmdGVyCj4gYXBwbHlfYm9vdF9hbHRlcm5h
dGl2ZSgpLiBUaGlzIGNhbiBtYWtlIGFzc3VtcHRpb25zIG9uIGRpZmZlcmVudCBwaWVjZQo+IG9m
IGNvZGUgbW9yZSBjb2hlcmVudC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4KClJlb3JkZXIgdGhlIGlu
aXRfcnRfc2lnbmFsX2VudigpIGFuZCBhcHBseV9ib290X2FsdGVybmF0aXZlKCkgaXMKYmV0dGVy
LCBJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rIHlvdSEKClJlZ2FyZHMs
CllvbmctWHVhbgoKPgo+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X3Zfc2Nfc2l6ZSA9IHNpemVv
ZihzdHJ1Y3QgX19yaXNjdl9jdHhfaGRyKSArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKHN0cnVjdCBfX3NjX3Jpc2N2X3Zfc3RhdGUpICsgcmlzY3Zfdl92c2l6
ZTsKPiA+ICsgICAgICAgICAgICAgICBmcmFtZV9zaXplICs9IHJpc2N2X3Zfc2Nfc2l6ZTsKPiA+
ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBmcmFtZV9zaXplID0gcm91bmRfdXAoZnJhbWVf
c2l6ZSwgMTYpOwo+ID4gKwo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAgKiBEZXRlcm1pbmUg
dGhlIHN0YWNrIHNwYWNlIHJlcXVpcmVkIGZvciBndWFyYW50ZWVkIHNpZ25hbCBkZWxpdmVyeS4K
PiA+ICAgICAgICAgICogVGhlIHNpZ25hbF9taW5zaWdzdGtzeiB3aWxsIGJlIHBvcHVsYXRlZCBp
bnRvIHRoZSBBVF9NSU5TSUdTVEtTWiBlbnRyeQo+ID4gICAgICAgICAgKiBpbiB0aGUgYXV4aWxp
YXJ5IGFycmF5IGF0IHByb2Nlc3Mgc3RhcnR1cC4KPiA+ICAgICAgICAgICovCj4gPiAtICAgICAg
IHNpZ25hbF9taW5zaWdzdGtzeiA9IGdldF9ydF9mcmFtZV9zaXplKHRydWUpOwo+ID4gKyAgICAg
ICBzaWduYWxfbWluc2lnc3Rrc3ogPSBmcmFtZV9zaXplOwo+ID4gIH0KPiA+Cj4gPiAgI2lmZGVm
IENPTkZJR19EWU5BTUlDX1NJR0ZSQU1FCj4gPiAgYm9vbCBzaWdhbHRzdGFja19zaXplX3ZhbGlk
KHNpemVfdCBzc19zaXplKQo+ID4gIHsKPiA+IC0gICAgICAgcmV0dXJuIHNzX3NpemUgPiBnZXRf
cnRfZnJhbWVfc2l6ZShmYWxzZSk7Cj4gPiArICAgICAgIHJldHVybiBzc19zaXplID4gZ2V0X3J0
X2ZyYW1lX3NpemUoY3VycmVudF9wdF9yZWdzKCkpOwo+ID4gIH0KPiA+ICAjZW5kaWYgLyogQ09O
RklHX0RZTkFNSUNfU0lHRlJBTUUgKi8KPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4KPiBUaGFua3Ms
Cj4gQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
