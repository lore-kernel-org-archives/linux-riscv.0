Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E939C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:36:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7864122227
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 11:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7864122227
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IHHPzTuhEiGuC4u0bnnMISBpletv1fRYkAeKrQOHU4g=; b=SdjhkE/5KytYGGzqqXwFEQ45s
	WdOaetLBsefKIuvHFY2MK79zlOxcj3BllhcTcVJb0UJD69PZVFnazuEbvUZSJrmD0aBOxRqf/PMLp
	xWGo8HaACuLI0YRdLjsHHLNEErH65A7II2mLbOPL2258XUs7dd4KvbuoXMRKWUV3dL4iEHjfAA5RR
	qJOlPdtmUO1TIg+M/Bi/+FK+mL60z8IttMiBxlbs/jKw0tPyl6GHCo92BZxMXR+ds7ap8qTS1wV4+
	o5KjF4WH5E/TQC+3dyTtYhE2I+UGVHe7xkQ7vzpr3rufJCKIt77A6R/2MCsGzIvxXr92LqKMR9Rzs
	/eTuJ896Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1SpK-0007Bx-TJ; Mon, 18 Jan 2021 11:36:06 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1SpH-0007B4-9Y
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 11:36:04 +0000
Received: by mail-ej1-f49.google.com with SMTP id hs11so20890985ejc.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 03:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=22uanx9EjnQBRBNnKDA8nFkzRE1bySJQ4yOweDiaQTY=;
 b=ckU/p6c7M4gjsFS8v4RIOhPl72MIgow+67MMohYEEs5Hcy3r7ZOb2W+VhwVjAxl6bq
 kJ1mf6Wh4E4l8oGNW+gAYAXYFDxblCko3ulDUg4cjEAlKAvaFDEIaTvWyoZOVXE5q8hi
 0CVu8aWEgpSrDTD8yKmYH4nqodnJD+1ADOaYt/Hov0uKzACbODb/QlDi/TMrD+N9QkCI
 jGuhXw9AggcLeYftXY9l3c+5LBXbJR2gtgDU7rKAHJy8ptS3t80w3TQklTBI4qvi+hbH
 Jjjgk6AFQNZWuGTcFHkyX9/9DMEDCRMWwx/dl5K/VXhtEQLyeWtgr0fOWzCIUhF5RWN6
 VzVQ==
X-Gm-Message-State: AOAM533LB4JLAoASZOZEIaGXnY5G+S7kp4gZ1/W3SmDu5Ye94Fh8VAZL
 LtOInznGX96AsDvvM0FcPiI=
X-Google-Smtp-Source: ABdhPJytr9xcaXlkWN+c/a7D86A0b2+xKocTgih6FEWmxisHsZVlt5WPOZjK2sG4+Tpz2mPnLUK13g==
X-Received: by 2002:a17:906:890:: with SMTP id
 n16mr15800893eje.195.1610969758882; 
 Mon, 18 Jan 2021 03:35:58 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id j3sm9326991eja.2.2021.01.18.03.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 03:35:58 -0800 (PST)
Date: Mon, 18 Jan 2021 12:35:56 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_063603_413714_3F00D055 
X-CRM114-Status: GOOD (  23.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCnNvcnJ5IGZvciBteSBtaXN0YWtlLiBFZmZlY3RpdmVseSBnbGliYyBkb2VzIG5v
dCBwcm92aWRlIGEgd3JhcHBlciBmb3IKZnV0ZXggc3lzY2FsbCwgc28gaXRzIHVzYWdlIGlzIG9i
dmlvdXNseSBub3QgYSBzb2x1dGlvbi4KCkZvbGxvd2luZyB3aGF0IGNhbiBiZSBmb3VuZCBpbiBn
bGliYyByaXNjdiBzeXNkZXAuaCBmaWxlOgoKfCNpZiBfX1dPUkRTSVpFID09IDMyCnwvKiBXb3Jr
YXJvdW5kcyBmb3IgZ2VuZXJpYyBjb2RlIG5lZWRpbmcgdG8gaGFuZGxlIDY0LWJpdCB0aW1lX3Qu
CnwuLi4KfC8qIEZpeCBzeXNkZXBzL25wdGwvbG93bGV2ZWxsb2NrLWZ1dGV4LmguICAqLwp8I2Rl
ZmluZSBfX05SX2Z1dGV4ICAgICAgICAgICAgICBfX05SX2Z1dGV4X3RpbWU2NAoKYSBwb3NzaWJs
ZSBzb2x1dGlvbiB0byBmaXggdGhlIGJ1aWxkIG9mIHBlcmYgdG9vbCBvbiBSSVNDViAzMiBiaXQg
Y291bGQKYmUgdGhlIGZvbGxvd2luZyBwYXRjaCB0byBmaWxlIHRvb2xzL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS91bmlzdGQuaDoKfCsKfCsjaWZuZGVmIF9fTlJfZnV0ZXgKfCsjZGVmaW5l
IF9fTlJfZnV0ZXggX19OUl9mdXRleF90aW1lNjQKfCsjZW5kaWYKCldoYXQgZG8geW91IHRoaW5r
IGFib3V0IGl0PyBDb3VsZCBpdCBiZSBhIGNvcnJlY3Qgc29sdXRpb24/CgpCZXN0IHJlZ2FyZHMs
CgpFbWlsaWFubwoKT24gVGh1LCBKYW4gMTQsIDIwMjEgYXQgMDg6MTY6MjhQTSArMDEwMCwgQXJu
ZCBCZXJnbWFubiB3cm90ZToKPiBPbiBUaHUsIEphbiAxNCwgMjAyMSBhdCA3OjM4IFBNIEVtaWxp
YW5vIEluZ3Jhc3NpYQo+IDxpbmdyYXNzaWFAZXBpZ2VuZXN5cy5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpLAo+ID4KPiA+IFdoZW4gYnVpbGRpbmcgcGVyZiBmb3IgUklTQ1YgMzIgYml0ICh2NS4xMC43
KSBJIGdvdCB0aGUgZm9sbG93aW5nCj4gPgo+ID4gfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gYmVu
Y2gvZnV0ZXgtaGFzaC5jOjI5Ogo+ID4gfCBiZW5jaC9mdXRleC5oOiBJbiBmdW5jdGlvbiDigJhm
dXRleF93YWl04oCZOgo+ID4gfCBiZW5jaC9mdXRleC5oOjM3OjEwOiBlcnJvcjog4oCYU1lTX2Z1
dGV44oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBt
ZWFuIOKAmFNZU190ZWXigJk/Cj4gPgo+ID4gVGhpcyBpc3N1ZSBpcyBzaW1pbGFyIHRvIHRoZSBv
bmUgcmVwb3J0ZWQgaW4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvNC8xOS82MzEKPiA+Cj4g
PiBJIGZvdW5kIHRoYXQgcGF0Y2hpbmcgdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L3VuaXN0ZC5oIGFzIGZvbGxvd2luZzoKPiA+Cj4gPiAgI2lmZGVmIF9fTFA2NF9fCj4gPiAgI2Rl
ZmluZSBfX0FSQ0hfV0FOVF9ORVdfU1RBVAo+ID4gICNkZWZpbmUgX19BUkNIX1dBTlRfU0VUX0dF
VF9STElNSVQKPiA+ICsjZWxzZQo+ID4gKyNkZWZpbmUgX19BUkNIX1dBTlRfVElNRTMyX1NZU0NB
TExTCj4gPiAgI2VuZGlmIC8qIF9fTFA2NF9fICovCj4gPgo+ID4gc29sdmVkIHRoZSBwcm9ibGVt
Lgo+ID4KPiA+IEkgYWxzbyBmb3VuZCB0aGF0IGEgc2ltaWxhciBwYXRjaCBmb3IgYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oCj4gPiB3YXMgcmVtb3ZlZCBpbiBjb21taXQgZDRj
MDhiOTc3NmIzLCBzbyBwcm9iYWJseSB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgd2F5KD8pLgo+Cj4g
SW4gc2hvcnQsIGl0IHdvbid0IHdvcmssIGFzIHJ2MzIgZG9lcyBub3QgcHJvdmlkZSB0aGUgdGlt
ZTMyIHN5c2NhbGxzLgo+IFlvdXIgcGF0Y2ggd2lsbCBtYWtlIHRoZSBhcHBsaWNhdGlvbiBidWls
ZCwgYnV0IGl0IHdpbGwgbm90IGJlIGFibGUgdG8KPiBjYWxsIGZ1dGV4KCkuCj4KPiBZb3Ugd2ls
bCBpbiBmYWN0IHJ1biBpbnRvIGEgcmVsYXRlZCBwcm9ibGVtIG9uIGFueSAzMi1iaXQgYXJjaGl0
ZWN0dXJlCj4gaWYgQ09ORklHX0NPTVBBVF8zMkJJVF9USU1FIGlzIGRpc2FibGVkLCBvciBpZiB5
b3UgcGFzcyBhIG5vbi1OVUxMCj4gdGltZW91dCBwYXJhbWV0ZXIgYW5kIGJ1aWxkIHdpdGggYSB0
aW1lNjQtZW5hYmxlZCBsaWJjLgo+Cj4gVGhlIGZpeCBpbiB0aGUgYXBwbGljYXRpb24gaXMgdG8g
Y2FsbCBlaXRoZXIgX19OUl9mdXRleCBvciBfX05SX2Z1dGV4NjQKPiBkZXBlbmRpbmcgb24gdGhl
IGRlZmluaXRpb24gb2YgdGltZV90IGluIHRoZSBDIGxpYnJhcnkuIEkgd291bGQgcmVjb21tZW5k
Cj4gZG9pbmcgaXQgbGlrZQo+Cj4gI2lmZGVmIF9fTlJfZnV0ZXgKPiAjZGVmaW5lIGRvX2Z1dGV4
IChzaXplb2YodGltZV90KSA9PSBzaXplb2YoX19rZXJuZWxfbG9uZ190KSkgPyBcCj4gICAgICAg
ICAgX19OUl9mdXRleCA6IF9fTlJfZnV0ZXhfdGltZTY0Cj4gI2Vsc2UKPiAjZGVmaW5lIGRvX2Z1
dGV4IF9fTlJfZnV0ZXgKPiAjZG9uZQo+Cj4gICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
