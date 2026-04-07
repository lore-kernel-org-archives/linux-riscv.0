Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DADFEEF25
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpM3ibc/UjhIqIkVkNVXArPJhjOvhJ4LXZM5t+aEY7Q=; b=S9BnAHc/uQ7vTK
	M/lphBF8Y3zm9nr5Oa3DPEqYp0tQqp4ha6ZgD5+8mVPmFonjOvsmHwMdljZydsXEUH0GgvIPDY/rC
	vqWbp7fUAGuajTAHqmlx3jJxGKTLbR+rptXulBsaFMTVITNRV7LomEUWIg0Xjuw/+fdsFL8YLgnKx
	8UaQX3xyXtW3BOr75sEt6j37rRQbnpqkrPU8zdzQMaRCxLKDn7X7MRBH3tVtokgV2fYxe9Ca5lsRZ
	d9CJY0ZogBsfkXFCLfA/n2R8ap3V8LJIlqoPKJFE7dkItYOyPVwbHjTudPZiNGm+LZrxoFe3rs7gc
	+TJU/4euiwfMelk9uPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4hp-00000006NSw-0EHC;
	Tue, 07 Apr 2026 11:34:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4hm-00000006NSb-1zBc
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 11:34:51 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso2988721e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775561688; x=1776166488; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOq5Ru7+IXv6h9Pzbv62UIt1K2+sI1g8nh2ntawKT+k=;
        b=ftpkaUKpWRCZ8iyHzIX/8w5ftNAlcN+JvvkZEdck4DXQfZl2d0+S+v3r9Nj17oVcqu
         oHthvgnhxQkQHtWLaGOUu8P6nkp3hYjmn2Q357QXvSxspecj4I9ws4FpUsC4LGkbEviW
         v/jP+ugcGI2LsHqoZxVhf+TRNkU+e1rCXbW24n5prwkX/+IO6k21fovNhFPG9pVRonl4
         cBUrVg1G6c2joqMxjT3jMiph3BpGJIoRRohUSdsUFIwHh0Ds0DZyPRn0zTu4erCGidRz
         12VmrU+xpKmOyJ64ZFF/U7QfV61tPO+kKM/mQRfgYroZsxorKBEZ4RMcKZlaGWX8HQS+
         r+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561688; x=1776166488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOq5Ru7+IXv6h9Pzbv62UIt1K2+sI1g8nh2ntawKT+k=;
        b=kbji0E/xHhCpy/iWW+JH3TiZwqDQcq27xL63c+3721+kgc8kAAWXI0xTYIDorON1ai
         +rBEAm2WrcyDQYh7bkezvJ8WzmnqjEj7+k1I0fbk4HwqWGghzjN6hs0B+Oo6IKCtx/YS
         DEwaH9iBMLpoiJtm2nfr3OupQvEXMgQviImxYEGoX3IwDQLiPWUJELhSnAIMldNQ7XF8
         M8Lt974+kmu1jpfGMRqd8xlYRU7oueYDBLKYDdm7Ful8hs5/wQu8MQYemy82UsjBm0Hp
         TzMMzaOcvDanIdz1z1/w3a1vBf42KKza1CdHBsYqVoPhNr7ShcZaqkhesPOofSf/lHIu
         IJSQ==
X-Gm-Message-State: AOJu0YxK6o4JhGc9kgaK7EliP27Sr62jY3BO5cZWJl0mcjSojxaGT2+n
	mhQ8Pg+ACapoiUVfUtwqtUnnOcYSSxskGsW7dUtI0kvsVojTFIZ2X4LE
X-Gm-Gg: AeBDievtIQ7LUDR1XBBsTMFz601jlxkEDZxYRexwDgxGJ2F3iGwlYy1/xgojqQNJBNC
	SbyUB9aEUIkXZJiZbe+qJkAy6sv7/WnHlrGChTIkd18sbqysv9WJb7aBKyMAN897THyocnKRP28
	C8Hv9ENs/MeRNVgeE+7s49/tsGgGpHbKQQxQplmoFN6weIGx8xUjuaznTFB+dmeyhWq1XWaB6O6
	XETHOROOWolwmHqstK0HM1w8AKJdDgeW77TIVRIvqsOuCsN0l+s1Ut7zp8JuGjSy7Kp5jVtKZ8a
	wtQRbGdNOLnh4K2JJHh2NF/e76TP3j3vuKCplHtOjo+vCMs562IlucLuczbQMadiZdYNSKJP0Wr
	56Bcdyqc8HWijexZ25Ogeg4uA5o/1z58ahP8txTDE6iiFvW2UyI824/en78MPYSKFylnTbDzggd
	Lcg3TkZ4HKjUns/0GhqRbK5g7HUwASKKNqVXjGLIQ=
X-Received: by 2002:a05:6512:1593:b0:5a2:ca96:519 with SMTP id 2adb3069b0e04-5a32f6c0592mr4555613e87.3.1775561687772;
        Tue, 07 Apr 2026 04:34:47 -0700 (PDT)
Received: from imamay-pc ([46.73.133.192])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm3974814e87.9.2026.04.07.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:34:47 -0700 (PDT)
Date: Tue, 7 Apr 2026 14:34:45 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260407113445.oqjvwkdgweqj6xku@imamay-pc>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260319103629.by3bw3qeev26jvqq@imamay-pc>
 <CA+Ht8=bdEpQTa_7gu0MD43-=eDm-2AESkEVK4F6VTuOVOkzwMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Ht8=bdEpQTa_7gu0MD43-=eDm-2AESkEVK4F6VTuOVOkzwMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_043450_570969_DA0738C9 
X-CRM114-Status: GOOD (  42.43  )
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

SGkgSGltYW5zaHUsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkgcmVnYXJkaW5nIHRoZSB0ZGF0
YTEuaGl0IGNoZWNrLiBIb3dldmVyLCB0aGVyZSBpcwphIHNlY29uZCBpc3N1ZSBJIHJhaXNlZCBp
biBteSBwcmV2aW91cyBtZXNzYWdlIHRoYXQgc2VlbXMgdG8gaGF2ZSBiZWVuCm92ZXJsb29rZWQu
IEkgYWxzbyB1c2VkIHRoZSB3cm9uZyB0ZXJtaW5vbG9neSBpbiBteSBwcmV2aW91cyBtZXNzYWdl
IGFuZCB3b3VsZApsaWtlIHRvIGNsYXJpZnkgdGhlIGlzc3VlOgoKQ3VycmVudGx5LCBhcmNoX2lu
c3RhbGxfaHdfYnJlYWtwb2ludCgpIGNhbGxzIFNCSV9FWFRfREJUUl9UUklHX0lOU1RBTEwgb25s
eQp3aGVuIHRoZSBwZXJmIGV2ZW50IGlzIGJlaW5nIHNjaGVkdWxlZCBvbiB0aGUgdHJhY2VlLiBJ
ZiB0aGF0IGNhbGwgZmFpbHMKKGUuZy4sIGJlY2F1c2UgdGhlIGhhcmR3YXJlIFdBUkwgZmllbGRz
IGRvIG5vdCBhY2NlcHQgdGhlIHJlcXVlc3RlZAp0ZGF0YTEtdGRhdGEzIHZhbHVlcyksIHRoZXJl
IGlzIG5vIHdheSB0byBub3RpZnkgdGhlIHRyYWNlciBvciByZWplY3QgdGhlCmJyZWFrcG9pbnQg
ZWFybGllci4gVGhlIGJyZWFrcG9pbnQgd2lsbCBzaW1wbHkgbmV2ZXIgZmlyZSwgYW5kIHRoZSB0
cmFjZXIgb25seQpkaXNjb3ZlcnMgdGhpcyBhZnRlciB0aGUgZmFjdCBieSByZWFkaW5nIHRoZSBw
ZXJmX2V2ZW50IHN0YXRlIOKAkyBieSB3aGljaCB0aW1lCnRoZSB0cmFjZWUgbWF5IGhhdmUgYWxy
ZWFkeSBwYXNzZWQgdGhlIHBvaW50IG9mIGludGVyZXN0LgoKVGhlcmUgaXMgbm8gd2F5IGluIHRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGZvciB0aGUgdHJhY2VyIHRvIHZlcmlmeSB0aGF0IHRo
ZQpicmVha3BvaW50IGNhbm5vdCBiZSBpbnN0YWxsZWQgYmVjYXVzZSBvZiBXQVJMIGNvbnN0cmFp
bnRzLgoKSSB1bmRlcnN0YW5kIHRoYXQgYSBmdWxsIHNvbHV0aW9uIG1pZ2h0IGJlIG5vbi10cml2
aWFsLiBIb3dldmVyLCBjb3VsZCB5b3UKYXQgbGVhc3Qgc2hhcmUgeW91ciB0aG91Z2h0cyBvbiBo
b3cgdGhpcyBjb3VsZCBiZSBhZGRyZXNzZWQ/CgpSZWdhcmRzLApJbHlhCgpPbiBNb24sIEFwciAw
NiwgMjAyNiBhdCAxMDoxOTozMEFNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+IEhp
IElseWEsCj4gCj4gT24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNDowNuKAr1BNIElseWEgTWFtYXkg
PG1tYW1heWthMDFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwgSGltYW5zaHUKPiA+Cj4g
PiBJIGhhdmUgYmVlbiB1c2luZyB5b3VyIHByZXZpb3VzIEhCUCBpbXBsZW1lbnRhdGlvbiBmb3Ig
c29tZSB0aW1lIGFuZCBoYXZlCj4gPiBlbmNvdW50ZXJlZCBzb21lIG9mIGl0cyBzaG9ydGNvbWlu
Z3MsIHdoaWNoIHRoaXMgaW1wbGVtZW50YXRpb24gaGFzIGFsc28KPiA+IGluaGVyaXRlZC4KPiA+
Cj4gPiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAxMDoxOToxN0FNICswNTMwLCBIaW1hbnNodSBD
aGF1aGFuIHdyb3RlOgo+ID4gPiArLyoKPiA+ID4gKyAqIEhXIEJyZWFrcG9pbnQvd2F0Y2hwb2lu
dCBoYW5kbGVyCj4gPiA+ICsgKi8KPiA+ID4gK3N0YXRpYyBpbnQgaHdfYnJlYWtwb2ludF9oYW5k
bGVyKHN0cnVjdCBkaWVfYXJncyAqYXJncykKPiA+ID4gK3sKPiA+ID4gKyAgICAgaW50IHJldCA9
IE5PVElGWV9ET05FOwo+ID4gPiArICAgICBzdHJ1Y3QgYXJjaF9od19icmVha3BvaW50ICpicDsK
PiA+ID4gKyAgICAgc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50Owo+ID4gPiArICAgICBpbnQgaTsK
PiA+ID4gKwo+ID4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZGJ0cl90b3RhbF9udW07IGkrKykg
ewo+ID4gPiArICAgICAgICAgICAgIGV2ZW50ID0gdGhpc19jcHVfcmVhZChwY3B1X2h3X2JwX2V2
ZW50c1tpXSk7Cj4gPiA+ICsgICAgICAgICAgICAgaWYgKCFldmVudCkKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgYnAgPSBj
b3VudGVyX2FyY2hfYnAoZXZlbnQpOwo+ID4gPiArICAgICAgICAgICAgIHN3aXRjaCAoYnAtPnR5
cGUpIHsKPiA+ID4gKyAgICAgICAgICAgICAvKiBCcmVha3BvaW50ICovCj4gPiA+ICsgICAgICAg
ICAgICAgY2FzZSBSVl9EQlRSX0JQOgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGJw
LT5hZGRyZXNzID09IGFyZ3MtPnJlZ3MtPmVwYykgewo+ID4KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGVyZl9icF9ldmVudChldmVudCwgYXJncy0+cmVncyk7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IE5PVElGWV9TVE9QOwo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAvKiBXYXRjaHBvaW50ICovCj4gPiA+ICsgICAgICAg
ICAgICAgY2FzZSBSVl9EQlRSX1dQOgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGJw
LT5hZGRyZXNzID09IGNzcl9yZWFkKENTUl9TVFZBTCkpIHsKPiA+Cj4gPiBTZHRyaWcgc3BlYyAo
NS43LjExIGFuZCA1LjcuMTIgaW4gdGhlIHRkYXRhMS5zZWxlY3QgZmllbGQgZGVzY3JpcHRpb24p
IHN0YXRlcyB0aGF0Ogo+ID4gIlRoZXJlIGlzIGF0IGxlYXN0ICghKSBvbmUgY29tcGFyZSB2YWx1
ZSBhbmQgaXQgY29udGFpbnMgdGhlIGxvd2VzdCB2aXJ0dWFsCj4gPiBhZGRyZXNzIG9mIHRoZSBh
Y2Nlc3MuIEluIGFkZGl0aW9uLCBpdCBpcyByZWNvbW1lbmRlZCB0aGF0IHRoZXJlIGFyZSBhZGRp
dGlvbmFsCj4gPiBjb21wYXJlIHZhbHVlcyBmb3IgdGhlIG90aGVyIGFjY2Vzc2VkIHZpcnR1YWwg
YWRkcmVzc2VzIG1hdGNoLiAoRS5nLiBvbiBhIDMyLWJpdAo+ID4gcmVhZCBmcm9tIDB4NDAwMCwg
dGhlIGxvd2VzdCBhZGRyZXNzIGlzIDB4NDAwMCBhbmQgdGhlIG90aGVyIGFkZHJlc3NlcyBhcmUK
PiA+IDB4NDAwMSwgMHg0MDAyLCBhbmQgMHg0MDAzIi4KPiA+Cj4gPiBBIDMyLWJpdCByZWFkIGZy
b20gMHg0MDAwIHdpbGwgZGVmaW5pdGVseSBoYXZlIGNvbXBhcmUgdmFsdWUgMHg0MDAwICh0aGUg
bG93ZXN0Cj4gPiB2aXJ0dWFsIGFkZHJlc3MpLCBidXQgbWF5IGFsc28gaGF2ZSBjb21wYXJlIHZh
bHVlcyBhdCAweDQwMDEsIDB4NDAwMiwgYW5kIDB4NDAwMy4KPiA+IFRoaXMgbWVhbnMgdGhhdCBh
IDE2LWJpdCB3YXRjaHBvaW50IGF0IDB4NDAwMiB3aWxsIGZpcmUgb24gdGhpcyAzMi1iaXQgcmVh
ZCwgeWV0Cj4gPiBzdHZhbCB3aWxsIGJlIDB4NDAwMCwgYW5kIHRoZSBjdXJyZW50IGh3X2JyZWFr
cG9pbnRfaGFuZGxlciBpbXBsZW1lbnRhdGlvbiB3aWxsCj4gPiBub3QgZGV0ZWN0IGl0Lgo+ID4K
PiA+IFRoZXJlZm9yZSwgaXQgaXMgaW1wb3J0YW50IHRvIGNoZWNrIHRkYXRhMS5oaXQgYml0ICh3
aGljaCBpbmRpY2F0ZXMgdGhhdCB0aGUKPiA+IHRyaWdnZXIgY29uZGl0aW9uIHdhcyBkZWZpbml0
ZWx5IG1ldCkgYW5kIG9ubHkgdXNlIHRoZSBjb21wYXJpc29uIGJldHdlZW4KPiA+IGJwLT5hZGRy
ZXNzIGFuZCBDU1JfU1RWQUwgYXMgYSBmYWxsYmFjayAoaWYgdGRhdGExLmhpdCBpcyBub3Qgc3Vw
cG9ydGVkIGJ5IHRoZQo+ID4gaGFyZHdhcmUpLgo+ID4KPiBZb3UgYXJlIHJpZ2h0LiBJIHdpbGwg
YWRkIHRoaXMgaW4gbXkgbmV4dCByZXZpc2lvbi4KPiAKPiBUaGFua3MgJiBSZWdhcmRzCj4gSGlt
YW5zaHUKPiAKPiA+ID4gKy8qIGF0b21pYzogY291bnRlci0+Y3R4LT5sb2NrIGlzIGhlbGQgKi8K
PiA+ID4gK2ludCBhcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludChzdHJ1Y3QgcGVyZl9ldmVudCAq
ZXZlbnQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIHN0cnVjdCBhcmNoX2h3X2JyZWFrcG9pbnQgKmJw
ID0gY291bnRlcl9hcmNoX2JwKGV2ZW50KTsKPiA+ID4gKyAgICAgdW5pb24gc2JpX2RidHJfc2ht
ZW1fZW50cnkgKnNobWVtID0gdGhpc19jcHVfcHRyKHNiaV9kYnRyX3NobWVtKTsKPiA+ID4gKyAg
ICAgc3RydWN0IHNiaV9kYnRyX2RhdGFfbXNnICp4bWl0Owo+ID4gPiArICAgICBzdHJ1Y3Qgc2Jp
X2RidHJfaWRfbXNnICpyZWN2Owo+ID4gPiArICAgICBzdHJ1Y3QgcGVyZl9ldmVudCAqKnNsb3Q7
Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgaWR4Owo+ID4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0
IHJldDsKPiA+ID4gKyAgICAgaW50IGVyciA9IDA7Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmF3X3Nw
aW5fbG9ja19pcnFzYXZlKHRoaXNfY3B1X3B0cigmZWNhbGxfbG9jayksCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqdGhpc19jcHVfcHRyKCZlY2FsbF9sb2NrX2ZsYWdzKSk7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgeG1pdCA9ICZzaG1lbS0+ZGF0YTsKPiA+ID4gKyAgICAgcmVjdiA9
ICZzaG1lbS0+aWQ7Cj4gPiA+ICsgICAgIHhtaXQtPnRkYXRhMSA9IGNwdV90b19sZShicC0+dGRh
dGExKTsKPiA+ID4gKyAgICAgeG1pdC0+dGRhdGEyID0gY3B1X3RvX2xlKGJwLT50ZGF0YTIpOwo+
ID4gPiArICAgICB4bWl0LT50ZGF0YTMgPSBjcHVfdG9fbGUoYnAtPnRkYXRhMyk7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRSX1RS
SUdfSU5TVEFMTCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIDEsIDAsIDAsIDAsIDAsIDAp
Owo+ID4KPiA+IHBlcmYgaW5zdGFsbHMgYnJlYWtwb2ludHMgKHZpYSB0aGUgY2FsbCBjaGFpbiBw
bXUuYWRkLT5hcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludCkKPiA+IGR1cmluZyBjb250ZXh0IHJv
dGF0aW9uIGFmdGVyIGEgcGVyZl9ldmVudF9vcGVuIG9yIHB0cmFjZSBjYWxsIGZpbmlzaGVzLgo+
ID4gU28sIGlmIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBnaXZlbiB0ZGF0YTEs
IHRkYXRhMiBhbmQgdGRhdGEzCj4gPiBjb25maWd1cmF0aW9uIGFuZCBPcGVuU0JJIGZhaWxzIHRv
IHNldCB1cCB0aGUgdHJpZ2dlciwgdGhlIGtlcm5lbCB3aWxsIHN0aWxsCj4gPiByZXBvcnQgdGhh
dCB0aGUgYnJlYWtwb2ludCB3YXMgc3VjY2Vzc2Z1bGx5IGluc3RhbGxlZC4KPiA+Cj4gPiBBIHBy
b2Jpbmcgc3RhZ2UgaXMgdGhlcmVmb3JlIG5lZWRlZCAgYmVmb3JlIG9yIGR1cmluZyBwZXJmIGV2
ZW50Cj4gPiByZWdpc3RyYXRpb24gdG8gZW5zdXJlIHRoYXQgYWxsIGJyZWFrcG9pbnRzIGNhbiBi
ZSBpbnN0YWxsZWQKPiA+IHN1Y2Nlc3NmdWxseSBkdXJpbmcgY29udGV4dCByb3RhdGlvbi4KPiA+
Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
