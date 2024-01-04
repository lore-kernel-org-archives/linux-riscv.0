Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C0BC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NIa15i/YQFP6KYC9i/q6hnlqZV7x/67Cqvf3K9Lt2E=; b=obaj2q460v5K6O
	JWiulpP09mDwKl5k2KaUDsxHEDIuklkf+P3AX9ZKkNmx/5d5rhdbCmP7xKbORx7naRMTY/s3BVEOh
	LMJ1fUHYzGVEzs0u9Q2CvTmiQzIwlC2ihyYZ/39dfV7mRACbOvdfJVEUCN0LY9/h9oe3OW6lPK+jx
	yBtIiFPmN1vanKvNlf0IsDMJ8yNuxDjT+HatidAwMhcx1L3gBB2YpPtliIgY8Y+0sEI9CkPwVCyqT
	ezUTc8pIPQsJGX1Jj5BPl3mLlta2BX93B00nV1dH6I/SRLpXW0xh2EI5QmXsWnfuDq8A7pndjuJkj
	p3DNMEE0nyexOW3oOvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPiW-00EVfy-24;
	Thu, 04 Jan 2024 15:33:08 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPiT-00EVez-33
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:33:07 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7b7fbe3db16so26162039f.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704382383; x=1704987183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0Upt/iz7+ki/+WrJa4hJcNtIggoZOENcRuMxGOqm14=;
        b=hTWRoBYWOPCAg9QEsfpAV1b6wf0HjaGrpi7d1wIfpwB9qTrz+2rPqOF+CxhJfvMeh9
         g1JgTR19pnd8DOpgikQ89sAZ6wfurN6Zmp22Bw6tq9BFoywj76+oP/+fSAiLFbpiWJDs
         4J0YFshpz+Ep31bPlUL5y1EJJKoslKFaWw8/TvVG+LghkrKH6D/FdA2FytVDG29A9acV
         okSy6+9fSa/MFLpYccRrob5SbdmkIFIZQnZdMYyaJ3lwz9QjMsz2MaqViYaG0B4UQgIq
         zzGgzTn2/7/t3bd/502J47C/z8bQxLI/unTj/kS8kG3VhQu5fk1ILJynARMguWY5acUF
         lbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382383; x=1704987183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0Upt/iz7+ki/+WrJa4hJcNtIggoZOENcRuMxGOqm14=;
        b=OJ5vIpWafIKe+gzMaz4/4L5Or+TmijpDIp4Y5i7hdAwq2f741VuYD8zy9mAVsjKUM1
         av2XyYLWXoQnSsQB7t4FDe8UBQ/iMEY+XY6qQAXjIH2WNjBjcLUhBHYdf9b37UjC4gxP
         1OuWbMcCdSkT6zA5+HJigNY2Y7fYetvyqPT/PHyVMcRR+WJ/ac4OY1kjOVlDYxWfzdAn
         ec36TgO0DvY+2saWtofBRzPAlXDl5YJizdD98mWUb6izf4PlKKvTEWT3d/xKs+aGqMWp
         CbbGMcqDA2lhpIJTNJ3/kbvOblHmuUPQFTls+NMNjFNYFgTStcFozybV4xhBJxPq9A3X
         dlKQ==
X-Gm-Message-State: AOJu0YwSYNDj5jAiFGIBJo4QIoamRWI5bfVY8dkzS6cmPQim7C8uyXwh
	6z2frPeAU8+bJrVokvkAeklgu39OFXFatw==
X-Google-Smtp-Source: AGHT+IGThkPps3feUu8OFnstPk+YphTbwG+KpAF9RDM/pLmpSVUYeGNXZ7d/hFN+Slfqm2z3ucRA2Q==
X-Received: by 2002:a5e:de4a:0:b0:7bb:df9d:c29b with SMTP id e10-20020a5ede4a000000b007bbdf9dc29bmr794314ioq.43.1704382382773;
        Thu, 04 Jan 2024 07:33:02 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id cv8-20020a056638498800b0046b4f448cc5sm7933260jab.91.2024.01.04.07.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:33:02 -0800 (PST)
Message-ID: <236f584e-76bf-4d98-8db4-562b627558bb@sifive.com>
Date: Thu, 4 Jan 2024 09:33:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] riscv: Only send remote fences when some other
 CPU is online
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-5-samuel.holland@sifive.com>
 <CAHVXubh+qnJCF1e6u8G0h+5fnfoGDHz0jjBr+KW11WZbKt3F9A@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAHVXubh+qnJCF1e6u8G0h+5fnfoGDHz0jjBr+KW11WZbKt3F9A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_073306_019483_5F0AAF1D 
X-CRM114-Status: GOOD (  22.60  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDEtMDQgNjozMyBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDIsIDIwMjQgYXQgMTE6MDHigK9QTSBTYW11ZWwgSG9sbGFuZAo+IDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gSWYgbm8gb3RoZXIgQ1BVIGlzIG9u
bGluZSwgYSBsb2NhbCBjYWNoZSBvciBUTEIgZmx1c2ggaXMgc3VmZmljaWVudC4KPj4gVGhlc2Ug
Y2hlY2tzIGNhbiBiZSBjb25zdGFudC1mb2xkZWQgd2hlbiBTTVAgaXMgZGlzYWJsZWQuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29t
Pgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiB2NDoKPj4gIC0gTmV3IHBhdGNoIGZvciB2NAo+Pgo+
PiAgYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgfCA0ICsrKy0KPj4gIGFyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYyAgIHwgNCArKystCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY2FjaGVm
bHVzaC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPj4gaW5kZXggNDdjNDg1YmM3ZGYw
Li5mNzkzM2FlODhhNTUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4+IEBAIC0yMSw3ICsyMSw5IEBA
IHZvaWQgZmx1c2hfaWNhY2hlX2FsbCh2b2lkKQo+PiAgewo+PiAgICAgICAgIGxvY2FsX2ZsdXNo
X2ljYWNoZV9hbGwoKTsKPj4KPj4gLSAgICAgICBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNl
KCkpCj4+ICsgICAgICAgaWYgKG51bV9vbmxpbmVfY3B1cygpIDwgMikKPj4gKyAgICAgICAgICAg
ICAgIHJldHVybjsKPj4gKyAgICAgICBlbHNlIGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2Uo
KSkKPj4gICAgICAgICAgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaShOVUxMKTsKPj4gICAgICAg
ICBlbHNlCj4+ICAgICAgICAgICAgICAgICBvbl9lYWNoX2NwdShpcGlfcmVtb3RlX2ZlbmNlX2ks
IE5VTEwsIDEpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+IGluZGV4IDJmMThmZTZmYzRmMy4uMzdiM2M5M2UzYzMw
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9tbS90bGJmbHVzaC5jCj4+IEBAIC03Myw3ICs3Myw5IEBAIHN0YXRpYyB2b2lkIF9faXBp
X2ZsdXNoX3RsYl9hbGwodm9pZCAqaW5mbykKPj4KPj4gIHZvaWQgZmx1c2hfdGxiX2FsbCh2b2lk
KQo+PiAgewo+PiAtICAgICAgIGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPj4gKyAg
ICAgICBpZiAobnVtX29ubGluZV9jcHVzKCkgPCAyKQo+PiArICAgICAgICAgICAgICAgbG9jYWxf
Zmx1c2hfdGxiX2FsbCgpOwo+PiArICAgICAgIGVsc2UgaWYgKHJpc2N2X3VzZV9zYmlfZm9yX3Jm
ZW5jZSgpKQo+PiAgICAgICAgICAgICAgICAgc2JpX3JlbW90ZV9zZmVuY2Vfdm1hX2FzaWQoTlVM
TCwgMCwgRkxVU0hfVExCX01BWF9TSVpFLCBGTFVTSF9UTEJfTk9fQVNJRCk7Cj4+ICAgICAgICAg
ZWxzZQo+PiAgICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoX19pcGlfZmx1c2hfdGxiX2FsbCwg
TlVMTCwgMSk7Cj4+IC0tCj4+IDIuNDIuMAo+Pgo+IAo+IG9uX2VhY2hfY3B1KCkgYWxyZWFkeSBk
ZWFscyBjb3JyZWN0bHkgd2l0aCBhIHNpbmdsZSBvbmxpbmUgY3B1LCB0aGUKPiBvbmx5IHRoaW5n
IHRvIG9wdGltaXplIGhlcmUgaXMgdGhlIFNCSSByZmVuY2UuIFNvIEknZCBtb3ZlIHRoaXMgbmV3
Cj4gdGVzdCBpbiBzYmlfcmVtb3RlX3NmZW5jZV92bWFfYXNpZCgpIGFuZCBzYmlfcmVtb3RlX2Zl
bmNlX2koKSB0byBhdm9pZAo+IHRoZSBzdXBlcmZsdW91cyBNLW1vZGUgZW50cnkgd2hlbiBvbmx5
IG9uZSBjcHUgaXMgb25saW5lIGJ5IGNoZWNraW5nCj4gdGhlIGNwdW1hc2suIEFuZCBzaW5jZSBz
YmlfcmVtb3RlX2ZlbmNlX2koKSBpcyB1c2VkIGluIGFub3RoZXIKCldoYXQgc3BlY2lmaWMgY3B1
bWFzayBjaGVjayBhcmUgeW91IHN1Z2dlc3Rpbmc/IEluIHNiaV9yZW1vdGVfc2ZlbmNlX3ZtYV9h
c2lkKCkKSSBkb24ndCB0aGluayB3ZSBjYW4gYXNzdW1lIHRoZSBsb2NhbCBjcHUgaXMgYWx3YXlz
IGluY2x1ZGVkIGluIHRoZSBjcHVtYXNrCih3aGljaCB3ZSBfY2FuXyBhc3N1bWUgaGVyZSksIHNv
IGl0IHdvdWxkIG5lZWQgdG8gY29uc3RydWN0L2NvbXBhcmUgdGhlIHdob2xlCmJpdG1hcC4gVGhh
dCdzIG11Y2ggbW9yZSBleHBlbnNpdmUgdGhhbiB0aGUgYXRvbWljIGxvYWQgaGVyZS4KCj4gZnVu
Y3Rpb24gKGZsdXNoX2ljYWNoZV9tbSgpKSwgd2UgY291bGQgYWxzbyB0YWtlIGFkdmFudGFnZSBv
ZiB0aGlzCj4gb3B0aW1pemF0aW9uIHdoZW4gb25seSB0aGUgbG9jYWwgY3B1IG11c3QgYmUgZmx1
c2hlZC4KCmZsdXNoX2ljYWNoZV9tbSgpIGFscmVhZHkgaGFzIGEgImxvY2FsIiB2YXJpYWJsZSB3
aGljaCBpdCB1c2VzIHRvIHNraXAgdGhlIGNhbGwKdG8gc2JpX3JlbW90ZV9mZW5jZV9pKCkuIFNh
bWUgd2l0aCB0aGUgYnJvYWRjYXN0IGNoZWNrIGluIF9fZmx1c2hfdGxiX3JhbmdlKCkuClNvIG5v
IGFkZGl0aW9uYWwgY2hlY2sgaXMgbmVlZGVkIHRoZXJlLiBUaG9zZSB0d28gZnVuY3Rpb25zLCBw
bHVzIHRoZSB0d28KY2hhbmdlZCBpbiB0aGlzIHBhdGNoLCBhcmUgdGhlIG9ubHkgY2FsbCBzaXRl
cyBvZiB0aGUgc2JpXyooKSBmdW5jdGlvbnMuIEkgdGhpbmsKaXQgbWFrZXMgbW9yZSBzZW5zZSB0
byBvcHRpbWl6ZSB0aGUgZm91ciBjYWxsIHNpdGVzIHRoYW4gYWRkaW5nIGFuIGFkZGl0aW9uYWwK
Y2hlY2sgaW4gdGhlIHNiaV8qKCkgZnVuY3Rpb25zLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
