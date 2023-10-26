Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60797C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr/h7WuzfLt8JA52qnqMpG5rrVp/1fJWqyc9gA40QiM=; b=AeEpAF0HwL6Ifc
	wsX9AyaQxGktM+9Ta1vchtrIPU2x1BP/qVGD3Qujh7Mx/stO4P3HghKBo3OPY1BIdUB+7XdUJaelQ
	wED+Udqm+Rd0EwjqYthAzXeRZClOyii2cf+LgfXZBgBeJ5dbWpEkntZPVHMCacd91rrjCLKqfBCsR
	mCKPyTYdQPbeQVyCJ0pr99hJD05pwv4OVob1v54mSQBS3AxFRkhMZF6YhRDlus2/HgNTFs2g7axWU
	Dp0Uo+7O3AF2XpziYXSVbkegh/yCfuUrBdiey1PORN2abL+Sdru6UU6y6kcEvtUSZd7CpQtVAUlke
	QoFH3YxyRi+jbpJON5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvumE-00DqYZ-37;
	Thu, 26 Oct 2023 07:27:34 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvumA-00DqX2-3A
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 07:27:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32da9ef390fso361334f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698305246; x=1698910046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GOVyAsfG7jyBY4Njn7QBJ3pGHQUz5eCfU/o5ji0p3w=;
        b=26S8jAo0Q0ICmlRd4EUHwO50HIAyMVGAPYgjdjJsvzCy+eljGiTXbvlqu5CnBDrT96
         KDxy30JLzNqElwHC4kRaaInGQIgb/53EpKsFj9duNBtlxYmp9H+uDmF23+xdKIny6mSY
         oTPJlDwn82/JA864v9Z3fTTftKTarkVNiQ2cBOhA0MZ8naFSpWG4IDa9SAHoDeeFUDu/
         HgWCU+W3NMIcDEr8DIBDwG0QO3XzjHi57/EJZfVg1t8nI/5eAmZ/ncWfBLMZnq1aR/q7
         sGzj9cTZrpygAi6T7dZqeN5INhW5PZ5yCL+bMh/l+sy9Zo4ScPmcvFmfmB+CYmAbUHH0
         6xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698305246; x=1698910046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GOVyAsfG7jyBY4Njn7QBJ3pGHQUz5eCfU/o5ji0p3w=;
        b=aCLmKKQ1tTDlX+xrOLYOWw3jeYGatuGubExwEwbQH2qn7YqwJ57W3LRjwWx2SZIHbg
         9agnBhR/wVQ5dABxMZ6B6jLtA1KeApAFlVdv/MXJr6GijeVqpxPb5S2+eIRMNJMyvuWR
         ttzQfZ52cUXSZmnpg/UEQiPq6PUr8+VzrtIKErWK/NUcCsqaELrf7Uwgl7DJJ2mQA7+v
         nFO8VQgrndnoR+BApg6cuXvqEO50Ga7Z7XRdbBLftSefujcXkMtda8hMzvmlO07d/pwO
         jLqT8MHBq9AWuLi5GiiT66XP/I/ki0BfgxQXGHHp3mH89/bZN7M7T6+hSj5hWV5w4z5U
         NfFA==
X-Gm-Message-State: AOJu0YyVS590FFUkQGfBsp+VyRFhFBzKr2tyV5pxIv0/X1HrmGzIcIRO
	34QvZZ+vlsy73LSuFu0VLKFhKLBdnbSlORpibGeb+w==
X-Google-Smtp-Source: AGHT+IGcD4kUEe5cN8KBNRsyJYWN+TZDSQzD4DKU1/Ul1fXsRYwZ+nlpfuoSa2vFns2pV4IgtbymsZIv7KJCJBusajc=
X-Received: by 2002:a5d:4bd0:0:b0:32d:9cf7:77e1 with SMTP id
 l16-20020a5d4bd0000000b0032d9cf777e1mr14476070wrt.9.1698305245901; Thu, 26
 Oct 2023 00:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231022144220.109469-1-alexghiti@rivosinc.com> <ZTXPXXjULgqikXjF@APC323>
In-Reply-To: <ZTXPXXjULgqikXjF@APC323>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 26 Oct 2023 09:27:15 +0200
Message-ID: <CAHVXubji94pU-=wYBiLnCFtdyiMvgTyzSGS9qqecYhsOuuxhww@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Do not broadcast to other cpus when
 starting a counter
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_002731_226540_B35A5825 
X-CRM114-Status: GOOD (  24.05  )
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

SGkgUGV0ZXIgTGluLAoKT24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMzo0MuKAr0FNIFl1LUNoaWVu
IFBldGVyIExpbgo8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGV4YW5k
cmUsCj4KPiBPbiBTdW4sIE9jdCAyMiwgMjAyMyBhdCAwNDo0MjoyMFBNICswMjAwLCBBbGV4YW5k
cmUgR2hpdGkgd3JvdGU6Cj4gPiBUaGlzIGNvbW1hbmQ6Cj4gPgo+ID4gJCBwZXJmIHJlY29yZCAt
ZSBjeWNsZXM6ayAtZSBpbnN0cnVjdGlvbnM6ayAtYyAxMDAwMCAtbSA2NE0gZGQgaWY9L2Rldi96
ZXJvIG9mPS9kZXYvbnVsbCBjb3VudD0xMDAwCj4gPgo+ID4gZ2l2ZXMgcmlzZSB0byB0aGlzIGtl
cm5lbCB3YXJuaW5nOgo+ID4KPiA+IFsgIDQ0NC4zNjQzOTVdIFdBUk5JTkc6IENQVTogMCBQSUQ6
IDEwNCBhdCBrZXJuZWwvc21wLmM6Nzc1IHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCsweDQy
Yy8weDQzNgo+ID4gWyAgNDQ0LjM2NDUxNV0gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPiBbICA0NDQu
MzY0NjU3XSBDUFU6IDAgUElEOiAxMDQgQ29tbTogcGVyZi1leGVjIE5vdCB0YWludGVkIDYuNi4w
LXJjNi0wMDA1MS1nMzkxZGY4MmU4ZWMzLWRpcnR5ICM3Mwo+ID4gWyAgNDQ0LjM2NDc3MV0gSGFy
ZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+ID4gWyAgNDQ0LjM2NDg2OF0gZXBj
IDogc21wX2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKzB4NDJjLzB4NDM2Cj4gPiBbICA0NDQuMzY0
OTE3XSAgcmEgOiBvbl9lYWNoX2NwdV9jb25kX21hc2srMHgyMC8weDMyCj4gPiBbICA0NDQuMzY0
OTQ4XSBlcGMgOiBmZmZmZmZmZjgwMDlmOWUwIHJhIDogZmZmZmZmZmY4MDA5ZmE1YSBzcCA6IGZm
MjAwMDAwMDAwMDM4MDAKPiA+IFsgIDQ0NC4zNjQ5NjZdICBncCA6IGZmZmZmZmZmODE1MDBhYTAg
dHAgOiBmZjYwMDAwMDAyYjgzMDAwIHQwIDogZmYyMDAwMDAwMDAwMzhjMAo+ID4gWyAgNDQ0LjM2
NDk4Ml0gIHQxIDogZmZmZmZmZmY4MTUwMjFmMCB0MiA6IDAwMDAwMDAwMDAwMDAwMWYgczAgOiBm
ZjIwMDAwMDAwMDAzOGIwCj4gPiBbICA0NDQuMzY0OTk4XSAgczEgOiBmZjYwMDAwMDAyYzU0ZDk4
IGEwIDogZmY2MDAwMDAwMmE3Mzk0MCBhMSA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgIDQ0NC4z
NjUwMTNdICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAzIGE0IDog
MDAwMDAwMDAwMDAwMDEwMAo+ID4gWyAgNDQ0LjM2NTAyOV0gIGE1IDogMDAwMDAwMDAwMDAxMDEw
MCBhNiA6IDAwMDAwMDAwMDBmMDAwMDAgYTcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICA0NDQu
MzY1MDQ0XSAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogZmZmZmZmZmZmZmZmZmZmZiBzNCA6
IGZmNjAwMDAwMDJjNTRkOTgKPiA+IFsgIDQ0NC4zNjUwNjBdICBzNSA6IGZmZmZmZmZmODE1Mzk2
MTAgczYgOiBmZmZmZmZmZjgwYzIwYzQ4IHM3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgNDQ0
LjM2NTA3NV0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAwMDAwMDEgczEw
OiAwMDAwMDAwMDAwMDAwMDAxCj4gPiBbICA0NDQuMzY1MDkwXSAgczExOiBmZmZmZmZmZjgwMDk5
Mzk0IHQzIDogMDAwMDAwMDAwMDAwMDAwMyB0NCA6IDAwMDAwMDAwZWFjMGM2ZTYKPiA+IFsgIDQ0
NC4zNjUxMDRdICB0NSA6IDAwMDAwMDA0MDAwMDAwMDAgdDYgOiBmZjYwMDAwMDAyZTAxMGQwCj4g
PiBbICA0NDQuMzY1MTIwXSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAw
MDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+ID4gWyAgNDQ0LjM2NTIyNl0gWzxm
ZmZmZmZmZjgwMDlmOWUwPl0gc21wX2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKzB4NDJjLzB4NDM2
Cj4gPiBbICA0NDQuMzY1Mjk1XSBbPGZmZmZmZmZmODAwOWZhNWE+XSBvbl9lYWNoX2NwdV9jb25k
X21hc2srMHgyMC8weDMyCj4gPiBbICA0NDQuMzY1MzExXSBbPGZmZmZmZmZmODA2ZTkwZGM+XSBw
bXVfc2JpX2N0cl9zdGFydCsweDdhLzB4YWEKPiA+IFsgIDQ0NC4zNjUzMjddIFs8ZmZmZmZmZmY4
MDZlODgwYz5dIHJpc2N2X3BtdV9zdGFydCsweDQ4LzB4NjYKPiA+IFsgIDQ0NC4zNjUzMzldIFs8
ZmZmZmZmZmY4MDEyMTExYT5dIHBlcmZfYWRqdXN0X2ZyZXFfdW50aHJfY29udGV4dCsweDE5Ni8w
eDFhYwo+ID4gWyAgNDQ0LjM2NTM1Nl0gWzxmZmZmZmZmZjgwMTIzN2FhPl0gcGVyZl9ldmVudF90
YXNrX3RpY2srMHg3OC8weDhjCj4gPiBbICA0NDQuMzY1MzY4XSBbPGZmZmZmZmZmODAwM2ZhZjQ+
XSBzY2hlZHVsZXJfdGljaysweGU2LzB4MjVlCj4gPiBbICA0NDQuMzY1MzgzXSBbPGZmZmZmZmZm
ODAwOGEwNDI+XSB1cGRhdGVfcHJvY2Vzc190aW1lcysweDgwLzB4OTYKPiA+IFsgIDQ0NC4zNjUz
OThdIFs8ZmZmZmZmZmY4MDA5OTFlYz5dIHRpY2tfc2NoZWRfaGFuZGxlKzB4MjYvMHg1Mgo+ID4g
WyAgNDQ0LjM2NTQxMF0gWzxmZmZmZmZmZjgwMDk5M2U0Pl0gdGlja19zY2hlZF90aW1lcisweDUw
LzB4OTgKPiA+IFsgIDQ0NC4zNjU0MjJdIFs8ZmZmZmZmZmY4MDA4YTZhYT5dIF9faHJ0aW1lcl9y
dW5fcXVldWVzKzB4MTI2LzB4MThhCj4gPiBbICA0NDQuMzY1NDMzXSBbPGZmZmZmZmZmODAwOGIz
NTA+XSBocnRpbWVyX2ludGVycnVwdCsweGNlLzB4MWRhCj4gPiBbICA0NDQuMzY1NDQ0XSBbPGZm
ZmZmZmZmODA2Y2RjNjA+XSByaXNjdl90aW1lcl9pbnRlcnJ1cHQrMHgzMC8weDNhCj4gPiBbICA0
NDQuMzY1NDU3XSBbPGZmZmZmZmZmODAwNmFmYTY+XSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsw
eDgwLzB4MTE0Cj4gPiBbICA0NDQuMzY1NDcwXSBbPGZmZmZmZmZmODAwNjViODI+XSBnZW5lcmlj
X2hhbmRsZV9kb21haW5faXJxKzB4MWMvMHgyYQo+ID4gWyAgNDQ0LjM2NTQ4M10gWzxmZmZmZmZm
ZjgwNDVmYWVjPl0gcmlzY3ZfaW50Y19pcnErMHgyZS8weDQ2Cj4gPiBbICA0NDQuMzY1NDk3XSBb
PGZmZmZmZmZmODA4YTljNjI+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4NGEvMHg3NAo+ID4gWyAgNDQ0
LjM2NTUyMV0gWzxmZmZmZmZmZjgwOGFhNzYwPl0gZG9faXJxKzB4N2MvMHg3ZQo+ID4gWyAgNDQ0
LjM2NTc5Nl0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4gPgo+ID4gVGhh
dCdzIGJlY2F1c2UgdGhlIGZpeCBpbiBjb21taXQgM2ZlYzMyMzMzOWE0ICgiZHJpdmVyczogcGVy
ZjogRml4IHBhbmljCj4gPiBpbiByaXNjdiBTQkkgbW1hcCBzdXBwb3J0Iikgd2FzIHdyb25nIHNp
bmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gYnJvYWRjYXN0Cj4gPiB0byBvdGhlciBjcHVzIHdoZW4g
c3RhcnRpbmcgYSBjb3VudGVyLCB0aGF0J3Mgb25seSBuZWVkZWQgaW4gbW1hcCB3aGVuCj4gPiB0
aGUgY291bnRlcnMgY291bGQgaGF2ZSBhbHJlYWR5IGJlZW4gc3RhcnRlZCBvbiBvdGhlciBjcHVz
LCBzbyBzaW1wbHkKPiA+IHJlbW92ZSB0aGlzIGJyb2FkY2FzdC4KPiA+Cj4gPiBGaXhlczogM2Zl
YzMyMzMzOWE0ICgiZHJpdmVyczogcGVyZjogRml4IHBhbmljIGluIHJpc2N2IFNCSSBtbWFwIHN1
cHBvcnQiKQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgo+ID4gVGVzdGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgNiArKy0t
LS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gaW5kZXggOTZjN2Y2NzBjOGYwLi40MzlkYTQ5ZGQw
YTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiArKysg
Yi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBAQCAtNTQzLDggKzU0Myw3IEBAIHN0
YXRpYyB2b2lkIHBtdV9zYmlfY3RyX3N0YXJ0KHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdTY0
IGl2YWwpCj4gPgo+ID4gICAgICAgaWYgKChod2MtPmZsYWdzICYgUEVSRl9FVkVOVF9GTEFHX1VT
RVJfQUNDRVNTKSAmJgo+ID4gICAgICAgICAgIChod2MtPmZsYWdzICYgUEVSRl9FVkVOVF9GTEFH
X1VTRVJfUkVBRF9DTlQpKQo+ID4gLSAgICAgICAgICAgICBvbl9lYWNoX2NwdV9tYXNrKG1tX2Nw
dW1hc2soZXZlbnQtPm93bmVyLT5tbSksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG11X3NiaV9zZXRfc2NvdW50ZXJlbiwgKHZvaWQgKilldmVudCwgMSk7Cj4gPiArICAgICAg
ICAgICAgIHBtdV9zYmlfc2V0X3Njb3VudGVyZW4oKHZvaWQgKilldmVudCk7Cj4gPiAgfQo+ID4K
PiA+ICBzdGF0aWMgdm9pZCBwbXVfc2JpX2N0cl9zdG9wKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVu
dCwgdW5zaWduZWQgbG9uZyBmbGFnKQo+ID4gQEAgLTU1NCw4ICs1NTMsNyBAQCBzdGF0aWMgdm9p
ZCBwbXVfc2JpX2N0cl9zdG9wKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdW5zaWduZWQgbG9u
ZyBmbGFnKQo+ID4KPiA+ICAgICAgIGlmICgoaHdjLT5mbGFncyAmIFBFUkZfRVZFTlRfRkxBR19V
U0VSX0FDQ0VTUykgJiYKPiA+ICAgICAgICAgICAoaHdjLT5mbGFncyAmIFBFUkZfRVZFTlRfRkxB
R19VU0VSX1JFQURfQ05UKSkKPiA+IC0gICAgICAgICAgICAgb25fZWFjaF9jcHVfbWFzayhtbV9j
cHVtYXNrKGV2ZW50LT5vd25lci0+bW0pLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtdV9zYmlfcmVzZXRfc2NvdW50ZXJlbiwgKHZvaWQgKilldmVudCwgMSk7Cj4gPiArICAg
ICAgICAgICAgIHBtdV9zYmlfc2V0X3Njb3VudGVyZW4oKHZvaWQgKilldmVudCk7CgpPaCBteSwg
Zm9ydHVuYXRlbHkgeW91IG5vdGljZWQgaXQsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgo+Cj4gcmVz
ZXQgaGVyZT8gc28gdGhlIENZL0lSIGJpdHMgY2FuIGJlIGNsZWFyZWQuCj4KPiBUaGFua3MgZm9y
IHRoZSBwYXRjaCwgZml4ZWQgdGhlIHdhcm5pbmcgc2VlbiBvbiBteSBib2FyZHMuCj4KPiBUZXN0
ZWQtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KClBlcmZl
Y3QsIHRoYW5rIHlvdSBhZ2FpbiwgSSBzZW5kIGEgbmV3IHZlcnNpb24gcmlnaHQgbm93LgoKQWxl
eAoKPgo+IEJlc3QgcmVnYXJkcywKPiBQZXRlciBMaW4KPgo+ID4KPiA+ICAgICAgIHJldCA9IHNi
aV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfQ09VTlRFUl9TVE9QLCBod2MtPmlkeCwg
MSwgZmxhZywgMCwgMCwgMCk7Cj4gPiAgICAgICBpZiAocmV0LmVycm9yICYmIChyZXQuZXJyb3Ig
IT0gU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQpICYmCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
