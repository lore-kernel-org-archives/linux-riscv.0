Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5305C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 17:00:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D29A22C7E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 17:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D29A22C7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q4xgZC3rA64Qz/XMWyjPYO4ltWkn91r5u4gCKVErvKQ=; b=ewx3iKZPNo1Wx9j9N+wgJ8/f5
	sT4YR1BPXRqdW+VJThznvpEfoIN39fdpY+pyMIng5kvL71knC+A7lv0Bn8REwGFcMzsjyiQfusKvv
	J/MGFFekFMggVOYavMXeQ/baArLsLvTc3F2qHZe8YJqjMcfGN1r9SLQhF4H+wd3KXepoumXo1lAKc
	QptMAK/jQOqa+HHFv+yuif7OeLnKx1Evv5aAX9yMoj8CfJ1vJ5ZSJkgVjCO1ik1kdj+pgPx3VEiT5
	Qa7jAmVSsbedIVz7v+Xp/eeMCWhlR5rVNh7t1krpySodr9N2AgphlRqvkOip+gJAPU3K3LSJFHi+C
	qvC7fqV0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1XtJ-0008JU-Ne; Mon, 18 Jan 2021 17:00:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1XtG-0008IW-Jp
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 17:00:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B19E822C9E
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610989229;
 bh=W6mdYXgoZxt7noeEV0ncPzuXdqYtCI5gVI08G1G+tNg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZzJoQAJqQPK7GvFwnQV24J8F4n5XA8eCw3xwd8UZ2KUU1vp6WkxcBO0/sbi9K47pg
 iPi9LUVu7CaqDHT6fZjfFZ4Mm3OjlHQrjT6xyodU0ogj+eXLuQv0QHMEF8c3TB6GcH
 M99Xizqy1d6NO3ecb10rR2pPl3r8ah3l/eQLJGfNClMnZYmWyMhPXUcNylomp3tW58
 yDiNBDpO+fjR8MIYlrU4q4d7gjUTvjOolCYac0bnG7Yqd13ooVBb9hz2+69hWprh6L
 Iskyj8rS0pozMLQL6NTJiqhy7NF5rDQvKuwv2YT2jHwjALqov3OmA9tgN0EJ4sgtUe
 O6RimsvymXQ4w==
Received: by mail-ot1-f54.google.com with SMTP id q25so16901667otn.10
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 09:00:29 -0800 (PST)
X-Gm-Message-State: AOAM531KDktMx/hgO5oiuetjv5015/xnR9dnWiLl0HgEtwPy7mEDslvs
 rae5W5cSrs1aImajScH7j4H1jEv9RfNtz7R0XuY=
X-Google-Smtp-Source: ABdhPJwi51y8ByGtH5HHM2C1zoKJOoMnFIUP4ltOb3+ZG0kCMsRwjxKKPy+W0xbjXLhDBR68BgPIksv9oLWsenN0Af8=
X-Received: by 2002:a9d:741a:: with SMTP id n26mr324009otk.210.1610989229061; 
 Mon, 18 Jan 2021 09:00:29 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
 <CAK8P3a0kOi55Dg-P-v+GcKdoLY6VOvv5Lj63X1=vL9LDR=Fe9A@mail.gmail.com>
 <YAW4gmkJzlG8kNf6@ingrassia.epigenesys.com>
In-Reply-To: <YAW4gmkJzlG8kNf6@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 18:00:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1O8-DuyF1nk08qqvv1Grf0FB_y9p-Kc6iFG3vp74Jd=Q@mail.gmail.com>
Message-ID: <CAK8P3a1O8-DuyF1nk08qqvv1Grf0FB_y9p-Kc6iFG3vp74Jd=Q@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_120030_775649_62FB9015 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMTgsIDIwMjEgYXQgNTozNCBQTSBFbWlsaWFubyBJbmdyYXNzaWEKPGluZ3Jh
c3NpYUBlcGlnZW5lc3lzLmNvbT4gd3JvdGU6Cj4KPiBpbiBhIHNpbXBsZSB1c2VyIHNwYWNlIGFw
cCB3aGljaCBjYWxscyBmdXRleCAoSSBjaGFuZ2VkIGRvX2Z1dGV4IHdpdGgKPiBTWVNfZnV0ZXgp
Ogo+Cj4gI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ICNpbmNsdWRlIDxzdGRpbnQuaD4KPiAjaW5jbHVk
ZSA8dW5pc3RkLmg+Cj4gI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Cj4gI2luY2x1ZGUgPGxpbnV4
L2Z1dGV4Lmg+Cj4gI2luY2x1ZGUgPHN5cy90aW1lLmg+Cj4KPiAjaWZkZWYgX19OUl9mdXRleAo+
ICNkZWZpbmUgU1lTX2Z1dGV4IChzaXplb2YodGltZV90KSA9PSBzaXplb2YoX19rZXJuZWxfbG9u
Z190KSkgPyBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
TlJfZnV0ZXggOiBfX05SX2Z1dGV4X3RpbWU2NAo+ICNlbHNlCj4gI2RlZmluZSBTWVNfZnV0ZXgg
X19OUl9mdXRleAo+ICNlbmRpZgoKTm90ZSB0aGF0IFNZU19mdXRleCB3aWxsIGNsYXNoIHdpdGgg
YSBsaWJjIGRlZmluZWQgbWFjcm8gb2YgdGhlIHNhbWUgbmFtZSwKc28gYmV0dGVyIGF2b2lkIHRo
YXQuCgpJIGd1ZXNzIHlvdSBhbHNvIG5lZWQgYSB0aGlyZCBwYXRoCgojaWZuZGVmIF9fTlJfZnV0
ZXggLyogdXNpbmcgdGltZTY0L19fa2VybmVsX3RpbWVzcGVjICovCi4uLgojZWxpZiAhZGVmaW5l
ZChfX05SX2Z1dGV4NjQpIC8qIHVzaW5nIF9fa2VybmVsX29sZF90aW1lc3BlYyAqLwouLi4KI2Vs
c2UgLyogbGliYyBkZXBlbmRlbnQgKi8KLi4uCiNlbmRpZgoKPiBzdGF0aWMgaW50Cj4gZnV0ZXgo
dWludDMyX3QgKnVhZGRyLCBpbnQgZnV0ZXhfb3AsIHVpbnQzMl90IHZhbCwKPiAgICAgICBjb25z
dCBzdHJ1Y3QgdGltZXNwZWMgKnRpbWVvdXQsIHVpbnQzMl90ICp1YWRkcjIsIHVpbnQzMl90IHZh
bDMpCj4gewo+ICAgICAgICAgcmV0dXJuIHN5c2NhbGwoU1lTX2Z1dGV4LCB1YWRkciwgZnV0ZXhf
b3AsIHZhbCwgdGltZW91dCwgdWFkZHIyLCB2YWwzKTsKPiB9Cj4KPiBpbnQgbWFpbih2b2lkKQo+
IHsKPiAgICAgICAgIHJldHVybiBmdXRleChOVUxMLCBGVVRFWF9XQUtFLCAwLCBOVUxMLCBOVUxM
LCAwKTsKPiB9Cj4KPiBCdXQgd2hhdCBJIGdldCBpczoKPgo+IGVycm9yOiDigJhfX05SX2Z1dGV4
4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgIDEyIHwgI2Rl
ZmluZSBTWVNfZnV0ZXggX19OUl9mdXRleAo+Cj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGlmIF9f
TlJfZnV0ZXggaXMgbm90IGRlZmluZWQgaXQgd2lsbCBub3Qgd29yayBhbnl3YXkuCgpSaWdodCwg
c29ycnkgYWJvdXQgdGhhdCwgc2VlIGFib3ZlLgoKPiBTbyB0aGUgb25seSB2aWFibGUgc29sdXRp
b24gdG8gY29ycmVjdGx5IGNvbXBpbGUgYW5kIHVzZSBwZXJmIG9uIHJpc2N2Cj4gMzIgYml0IGlz
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aW1lMzIgc3lzY2FsbCBmb3IgdGhhdCBhcmNoaXRlY3R1
cmU/CgpZb3Ugb25seSBuZWVkIGEgdGltZTMyIHN5c2NhbGwgaWYgeW91ciBsaWJjIGRlZmluZXMg
dGhlIHRpbWUzMgp2ZXJzaW9uIG9mICdzdHJ1Y3QgdGltZXNwZWMnLgoKPiBBbmQgdGhpcyBpcyB0
cnVlIGZvciBhbGwgMzIgYml0IGFwcGxpY2F0aW9ucyB0aGF0IHdhbnQgdG8gY2FsbCBmdXRleAo+
IHN5c2NhbGwgd2l0aCBhIG5vbiBOVUxMIHRpbWVyIHBhcmFtZXRlciwgcmlnaHQ/CgpBbHNvIHRo
ZSBvbmVzIHRoYXQgcGFzcyBhIE5VTEwgcGFyYW1ldGVyLCBhcyB0aGUga2VybmVsIGRvZXMKbm90
IG5lY2Vzc2FyaWx5IGltcGxlbWVudCBib3RoLgoKICAgICAgICAgQXJuZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
