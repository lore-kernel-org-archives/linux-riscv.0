Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiwTFEtfgqUE0lIkjT2XF8ILd/hXaf4ZKP6eOWAvOXI=; b=JZtjXKrxCo/3EE
	LK6Fgajh1VQ1exf4OnP0XxnUm+xwS6uVDHiD2VBy4Lnf4yiLIxU6I07I3EDDDFgunX7ibha+0infC
	xlGQUXyeMyMcf7Ubpy8yjgLeYOBoj6l8huCsywxxIIi5fZ99k9GPxIN2xFFZKlPMbrv+aw/mspB33
	r/Lc8Eq45T0tn4jSg5BItzmsxTqie8SAK/8TtZF1aWZZkroYCiFwa5elsrfSotRSW0edKMSMXug7Q
	8+qowqSXTb1HtVhdnkbefBw1WKESEGRsIHNoifo+SWq2A0wrw17hZKbc42w/dA61UEi4bR718VHqj
	N5TBsqzh3cw3W0iYumFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJCv-00DqOO-08;
	Wed, 13 Dec 2023 06:59:01 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDJCr-00DqLm-13
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 06:58:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28a5d0ebf1fso3013820a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 22:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702450736; x=1703055536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf5KPLLb5mppiqs2V6fQXEFnrR5qxzVp6zV/S8php7g=;
        b=a0HpAdb441bSLdbMlERlJ2lwwkHlIuHI5fA+EipbOhqizc8zrAwxLJroCg90rbfTht
         HGDsP6sSY2Q9SSbymEGHFmgrXfJyo8n/H5XJ6PqKhEB/1y5q1AOA2rHW7sk0Oq+CJ/EG
         5R2j6GSeA3O0IPiIlWTrjIlE7BW38ex1KXg881w9lVa0cbivCrBPlsW/aouBqQMQ4pWQ
         KCZUcYQQIGYbXGUOlON0Yl6izh4gqSJzMNlVpBfRv3Gy+VH68vkWhLHUUZXjWb3P9AF3
         mNzfVHqbSaxSYcJbNmuekanIbjlBz45vAKaTps3NVQYtJ7rdAz89frOH+e3vikSOglDm
         3dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702450736; x=1703055536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf5KPLLb5mppiqs2V6fQXEFnrR5qxzVp6zV/S8php7g=;
        b=vCyaevvnApVHORvA1Cfws6lk+9B9jZmAVUxAEAW3ILPMDp8XtXxn4bjribYNa6ruE9
         OY41FvGWOm74bN6DhaJDfbO1QRgwO7VNLSOzxgg+sJJ09kLHHRaznAEktJ75pSamwQt0
         8fcim87FASclfCWWE3URFgSe3ABICT/U3vqzk4fzhhMPzVFr7Id2YmyNrG0W0c8caINZ
         djfsA682L7AkgIkhrXkX0xwC6YAmBTAP3kytM27WwHPizaL+bUw38GdZXA0S3IScHrw2
         SqcJ0fiE6ru/ppoJ/HRPn+CJ/qPf1RpVNW+6BQbK2nXhYD00+Gyh2pJsNNxJueIsbCcQ
         ZVyA==
X-Gm-Message-State: AOJu0YyEPrkF+9NEBgEsIDAFSQisVpDd/yjkdDqB3uv4pijMt36Fw6S5
	qb5FYttiaOzvfuRzvB0v3RLIVTF9LduYYWVck5b/udL6X+TudQIxV3k=
X-Google-Smtp-Source: AGHT+IHcel4RGxuhUT4S+8ysviVVjUdeLRd5uUE5iIk9tDQ4l9HK3ci0gXUWjTSy85PhMRS2cyHdeWlEIcHWxtLc5Bs=
X-Received: by 2002:a17:90a:fd0b:b0:286:6cd8:ef09 with SMTP id
 cv11-20020a17090afd0b00b002866cd8ef09mr9239266pjb.33.1702450735785; Tue, 12
 Dec 2023 22:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20231213061610.11100-1-yongxuan.wang@sifive.com>
In-Reply-To: <20231213061610.11100-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 12:28:44 +0530
Message-ID: <CAAhSdy11SyXB0f0TOB4jX6mxCXTS-_RTXm6bFSfyY+4PThY5bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] RISCV: KVM: update external interrupt atomically
 for IMSIC swfile
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_225857_363282_3A65A02C 
X-CRM114-Status: GOOD (  28.18  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTE6NDbigK9BTSBZb25nLVh1YW4gV2FuZwo8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBlbXVsYXRlZCBJTVNJQyB1cGRhdGUg
dGhlIGV4dGVybmFsIGludGVycnVwdCBwZW5kaW5nIGRlcGVuZGluZyBvbiB0aGUKPiB2YWx1ZSBv
ZiBlaWRlbGl2ZXJ5IGFuZCB0b3BlaS4gSXQgbWlnaHQgbG9zZSBhbiBpbnRlcnJ1cHQgd2hlbiBp
dCBpcwo+IGludGVycnVwdGVkIGJlZm9yZSBzZXR0aW5nIHRoZSBuZXcgdmFsdWUgdG8gdGhlIHBl
bmRpbmcgc3RhdHVzLgo+Cj4gRm9yIGV4YW1wbGUsIHdoZW4gVkNQVTAgc2VuZHMgYW4gSVBJIHRv
IFZDUFUxIHZpYSBJTVNJQzoKPgo+IFZDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgVkNQ
VTEKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1NSU1dBUCB0b3BlaSA9IDAK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoZSBWQ1BVMSBoYXMgY2xhaW1lZCBh
bGwgdGhlIGV4dGVybmFsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHQgaW4gaXRzIGludGVycnVwdCBoYW5kbGVyLgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB0b3BlaSBvZiBWQ1BVMSdzIElNU0lDID0gMAo+Cj4gc2V0IHBlbmRpbmcgaW4gVkNQ
VTEncyBJTVNJQwo+Cj4gdG9wZWkgb2YgVkNQVTEnIElNU0lDID0gMQo+Cj4gc2V0IHRoZSBleHRl
cm5hbCBpbnRlcnJ1cHQKPiBwZW5kaW5nIG9mIFZDUFUxCj4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNsZWFyIHRoZSBleHRlcm5hbCBpbnRlcnJ1cHQgcGVuZGluZwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb2YgVkNQVTEKPgo+IFdoZW4gdGhlIFZDUFUxIHN3
aXRjaGVzIGJhY2sgdG8gVlMgbW9kZSwgaXQgZXhpdHMgdGhlIGludGVycnVwdCBoYW5kbGVyCj4g
YmVjYXVzZSB0aGUgcmVzdWx0IG9mIENTUlNXQVAgdG9wZWkgaXMgMC4gSWYgdGhlcmUgYXJlIG5v
IG90aGVyIGV4dGVybmFsCj4gaW50ZXJydXB0cyBpbmplY3RlZCBpbnRvIHRoZSBWQ1BVMSdzIElN
U0lDLCBWQ1BVMSB3aWxsIG5ldmVyIGtub3cgdGhpcwo+IHBlbmRpbmcgaW50ZXJydXB0IHVubGVz
cyBpdCBpbml0aWF0aXZlIHJlYWQgdGhlIHRvcGVpLgo+Cj4gSWYgdGhlIGludGVycnVwdGlvbiBv
Y2N1cnMgYmV0d2VlbiB1cGRhdGluZyBpbnRlcnJ1cHQgcGVuZGluZyBpbiBJTVNJQwo+IGFuZCB1
cGRhdGluZyBleHRlcm5hbCBpbnRlcnJ1cHQgcGVuZGluZyBvZiBWQ1BVLCBpdCB3aWxsIG5vdCBj
YXVzZSBhCj4gcHJvYmxlbS4gU3VwcG9zZSB0aGF0IHRoZSBWQ1BVMSBjbGVhcnMgdGhlIElQSSBw
ZW5kaW5nIGluIElNU0lDIHJpZ2h0Cj4gYWZ0ZXIgVkNQVTAgc2V0cyB0aGUgcGVuZGluZywgdGhl
IGV4dGVybmFsIGludGVycnVwdCBwZW5kaW5nIG9mIFZDUFUxCj4gd2lsbCBub3QgYmUgc2V0IGJl
Y2F1c2UgdGhlIHRvcGVpIGlzIDAuIEJ1dCB3aGVuIHRoZSBWQ1BVMSBnb2VzIGJhY2sgdG8KPiBW
UyBtb2RlLCB0aGUgcGVuZGluZyBJUEkgd2lsbCBiZSByZXBvcnRlZCBieSB0aGUgQ1NSU1dBUCB0
b3BlaSwgaXQgd2lsbAo+IG5vdCBsb3NlIHRoaXMgaW50ZXJydXB0Lgo+Cj4gU28gd2Ugb25seSBu
ZWVkIHRvIG1ha2UgdGhlIGV4dGVybmFsIGludGVycnVwdCB1cGRhdGluZyBwcm9jZWR1cmUgYXMg
YQo+IGNyaXRpY2FsIHNlY3Rpb24gdG8gYXZvaWQgdGhlIHByb2JsZW0uCj4KPiBGaXhlczogZGI4
YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2Yg
QUlBIElNU0lDIikKPiBUZXN0ZWQtYnk6IFJveSBMaW4gPHJveS5saW5Ac2lmaXZlLmNvbT4KPiBU
ZXN0ZWQtYnk6IFdheWxpbmcgQ2hlbiA8d2F5bGluZy5jaGVuQHNpZml2ZS5jb20+Cj4gQ28tZGV2
ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KClF1ZXVl
ZCBhcyBmaXhlcyBmb3IgTGludXgtNi43CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gQ2hhbmdlbG9n
Cj4gdjI6Cj4gLSByZW5hbWUgdGhlIHZhcmlhYmxlIGFuZCBhZGQgYSBzaG9ydCBjb21tZW50IGlu
IHRoZSBjb2RlCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgMTMgKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2lj
LmMKPiBpbmRleCA2Y2YyM2I4YWRiNzEuLmU4MDg3MjNhODVmMSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5j
Cj4gQEAgLTU1LDYgKzU1LDcgQEAgc3RydWN0IGltc2ljIHsKPiAgICAgICAgIC8qIElNU0lDIFNX
LWZpbGUgKi8KPiAgICAgICAgIHN0cnVjdCBpbXNpY19tcmlmICpzd2ZpbGU7Cj4gICAgICAgICBw
aHlzX2FkZHJfdCBzd2ZpbGVfcGE7Cj4gKyAgICAgICBzcGlubG9ja190IHN3ZmlsZV9leHRpcnFf
bG9jazsKPiAgfTsKPgo+ICAjZGVmaW5lIGltc2ljX3ZzX2Nzcl9yZWFkKF9fYykgICAgICAgICAg
ICAgICAgIFwKPiBAQCAtNjEzLDEyICs2MTQsMjMgQEAgc3RhdGljIHZvaWQgaW1zaWNfc3dmaWxl
X2V4dGlycV91cGRhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gICAgICAgICBzdHJ1
Y3QgaW1zaWMgKmltc2ljID0gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZTsKPiAg
ICAgICAgIHN0cnVjdCBpbXNpY19tcmlmICptcmlmID0gaW1zaWMtPnN3ZmlsZTsKPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFRoZSBj
cml0aWNhbCBzZWN0aW9uIGlzIG5lY2Vzc2FyeSBkdXJpbmcgZXh0ZXJuYWwgaW50ZXJydXB0Cj4g
KyAgICAgICAgKiB1cGRhdGVzIHRvIGF2b2lkIHRoZSByaXNrIG9mIGxvc2luZyBpbnRlcnJ1cHRz
IGR1ZSB0byBwb3RlbnRpYWwKPiArICAgICAgICAqIGludGVycnVwdGlvbnMgYmV0d2VlbiByZWFk
aW5nIHRvcGVpIGFuZCB1cGRhdGluZyBwZW5kaW5nIHN0YXR1cy4KPiArICAgICAgICAqLwo+ICsK
PiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpbXNpYy0+c3dmaWxlX2V4dGlycV9sb2NrLCBm
bGFncyk7Cj4KPiAgICAgICAgIGlmIChpbXNpY19tcmlmX2F0b21pY19yZWFkKG1yaWYsICZtcmlm
LT5laWRlbGl2ZXJ5KSAmJgo+ICAgICAgICAgICAgIGltc2ljX21yaWZfdG9wZWkobXJpZiwgaW1z
aWMtPm5yX2VpeCwgaW1zaWMtPm5yX21zaXMpKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3Zf
dmNwdV9zZXRfaW50ZXJydXB0KHZjcHUsIElSUV9WU19FWFQpOwo+ICAgICAgICAgZWxzZQo+ICAg
ICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV91bnNldF9pbnRlcnJ1cHQodmNwdSwgSVJRX1ZT
X0VYVCk7Cj4gKwo+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMtPnN3Zmls
ZV9leHRpcnFfbG9jaywgZmxhZ3MpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgaW1zaWNfc3dmaWxl
X3JlYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGNsZWFyLAo+IEBAIC0xMDM5LDYgKzEw
NTEsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luaXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+ICAgICAgICAgfQo+ICAgICAgICAgaW1zaWMtPnN3ZmlsZSA9IHBhZ2VfdG9fdmly
dChzd2ZpbGVfcGFnZSk7Cj4gICAgICAgICBpbXNpYy0+c3dmaWxlX3BhID0gcGFnZV90b19waHlz
KHN3ZmlsZV9wYWdlKTsKPiArICAgICAgIHNwaW5fbG9ja19pbml0KCZpbXNpYy0+c3dmaWxlX2V4
dGlycV9sb2NrKTsKPgo+ICAgICAgICAgLyogU2V0dXAgSU8gZGV2aWNlICovCj4gICAgICAgICBr
dm1faW9kZXZpY2VfaW5pdCgmaW1zaWMtPmlvZGV2LCAmaW1zaWNfaW9kb2V2X29wcyk7Cj4gLS0K
PiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
