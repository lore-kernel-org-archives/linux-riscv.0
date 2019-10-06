Return-Path: <SRS0=g64V=X7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FE7ECE58B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2019 19:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530562077B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2019 19:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jyg3Mb8Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yoHDBSHf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530562077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS2hvKvIeNt7/NxuZCiixoY6OMdPVxOGjxBFbK+HCh0=; b=Jyg3Mb8QdM95kq
	mGMBnWn5RGtk2iC7rdMA3zV04HRJ7/AhpaZbRp1zGgzVTIH0Rc1buyYMem+cwm0f7PR49VdlOWhji
	Xyi9qtjEnsJQabBGC9p6mQTaQTIiakH8/OlbSpVi4Ieb8s7DFfDP67puZE68HNQyYyF+a8p9qTcjZ
	oQ4fDt/07u30jin7+Xz4US5EzFLphnKt4EGTkXsfxjhr9iH6541wauJLa+P7fijVAmqXIrhyx4Xco
	7qztaBBooyCBsC9T6wtj4Hacr97SspeOBZzCa1JqEEmwFy2rCICmk9TmFBcXC5l47IQVA+Ytoucg3
	TkPYgLaIr0Oc6Rrprx7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHC3n-0007Nd-Kv; Sun, 06 Oct 2019 19:19:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHC3l-0007ND-9g
 for linux-riscv@lists.infradead.org; Sun, 06 Oct 2019 19:19:14 +0000
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED46D2087E
 for <linux-riscv@lists.infradead.org>; Sun,  6 Oct 2019 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570389552;
 bh=ktUpIaexhlxRiG4ce7iLuw4QHFnf1O8GxwmdLQRzKQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yoHDBSHfwn2R9DQNKNey6IjgYQQ3iKumA9xVSa4w7i0ZBbVIjDv7j4kF/rzp6dak+
 g+yjLDpx0ycO6XeI4GT37gZAk6+zY6rrqL9xPsh93vnexztlzjyD1+CL1A0VKcY7bU
 RNHZComg9ON5ELsv2hs0AaFM4rfSAe5HKQvYxpnE=
Received: by mail-wm1-f48.google.com with SMTP id r19so10359181wmh.2
 for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2019 12:19:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUkBHl9+luJzO9aQFiZLe0WQXxSOdfMmc7kGww0isfE9FQopwbX
 gCcL2itz7H2oqC2XBxZoWmqoeZt9ccBxvZf16/Kiog==
X-Google-Smtp-Source: APXvYqzx1ZnDJzMrKkfkPpBPdQaV6IOTwM8ALHjC39JfwEbpQY+QpI4wEbZ4dp0MU/oNOnC7f2vGFBUaGlcGv6Uudg8=
X-Received: by 2002:a1c:1bcf:: with SMTP id b198mr19073715wmb.0.1570389548492; 
 Sun, 06 Oct 2019 12:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <419CB0D1-E51C-49D5-9745-7771C863462F@amacapital.net>
 <mhng-c8a768f7-1a90-4228-b654-be9e879c92ec@palmer-si-x1c4>
 <CALCETrUmqKz4vu2VCPC5MYGFyiG4djbOmKG32oLtQPb=o6rJ_Q@mail.gmail.com>
In-Reply-To: <CALCETrUmqKz4vu2VCPC5MYGFyiG4djbOmKG32oLtQPb=o6rJ_Q@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sun, 6 Oct 2019 12:18:57 -0700
X-Gmail-Original-Message-ID: <CALCETrVrQf2B5T6GhoWWuMzrmvTBx9TWxEEN5ZEaXFCiajqMZg@mail.gmail.com>
Message-ID: <CALCETrVrQf2B5T6GhoWWuMzrmvTBx9TWxEEN5ZEaXFCiajqMZg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add support for SECCOMP and SECCOMP_FILTER
To: Andy Lutomirski <luto@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191006_121913_379996_ECD855A3 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: Song Liu <songliubraving@fb.com>, Alan Kao <alankao@andestech.com>,
 Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Yonghong Song <yhs@fb.com>,
 me@carlosedp.com, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Will Drewry <wad@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Network Development <netdev@vger.kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 LKML <linux-kernel@vger.kernel.org>, Vincent Chen <vincentc@andestech.com>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTo1OCBQTSBBbmR5IEx1dG9taXJza2kgPGx1dG9Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDM6MjcgUE0gUGFsbWVy
IERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIDI4IEF1
ZyAyMDE5IDEwOjUyOjA1IFBEVCAoLTA3MDApLCBsdXRvQGFtYWNhcGl0YWwubmV0IHdyb3RlOgo+
ID4gPgo+ID4gPgo+ID4gPj4gT24gQXVnIDI1LCAyMDE5LCBhdCAyOjU5IFBNLCBLZWVzIENvb2sg
PGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4+IE9uIFRodSwgQXVn
IDIyLCAyMDE5IGF0IDAxOjU1OjIyUE0gLTA3MDAsIERhdmlkIEFiZHVyYWNobWFub3Ygd3JvdGU6
Cj4gPiA+Pj4gVGhpcyBwYXRjaCB3YXMgZXh0ZW5zaXZlbHkgdGVzdGVkIG9uIEZlZG9yYS9SSVND
ViAoYXBwbGllZCBieSBkZWZhdWx0IG9uCj4gPiA+Pj4gdG9wIG9mIDUuMi1yYzcga2VybmVsIGZv
ciA8MiBtb250aHMpLiBUaGUgcGF0Y2ggd2FzIGFsc28gdGVzdGVkIHdpdGggNS4zLXJjCj4gPiA+
Pj4gb24gUUVNVSBhbmQgU2lGaXZlIFVubGVhc2hlZCBib2FyZC4KPiA+ID4+Cj4gPiA+PiBPb3Bz
LCBJIHNlZSB0aGUgbWVudGlvbiBvZiBRRU1VIGhlcmUuIFdoZXJlJ3MgdGhlIGJlc3QgcGxhY2Ug
dG8gZmluZAo+ID4gPj4gaW5zdHJ1Y3Rpb25zIG9uIGNyZWF0aW5nIGEgcWVtdSByaXNjdiBpbWFn
ZS9lbnZpcm9ubWVudD8KPiA+ID4KPiA+ID4gSSBkb27igJl0IHN1cHBvc2Ugb25lIG9mIHlvdSBy
aXNjdiBmb2xrcyB3b3VsZCBsaWtlIHRvIGNvbnRyaWJ1dGUgcmlzY3Ygc3VwcG9ydCB0byB2aXJ0
bWU/ICB2aXJ0bWUtcnVuIOKAlGFyY2g9cmlzY3Ygd291bGQgYmUgcXVpdGUgbmljZSwgYW5kIHRo
ZSB0b3RhbCBwYXRjaCBzaG91bGQgYmUganVzdCBhIGNvdXBsZSBsaW5lcy4gIFVuZm9ydHVuYXRl
bHksIGl0IGhlbHBzIGEgbG90IHRvIHVuZGVyc3RhbmQgdGhlIHN1YnRsZXRpZXMgb2YgYm9vdGlu
ZyB0aGUgYXJjaGl0ZWN0dXJlIHRvIHdyaXRlIHRob3NlIGNvdXBsZSBsaW5lcyA6KQo+ID4KCkZZ
SSwgaXQgd29ya3Mgbm93OgoKJCB2aXJ0bWUtY29uZmlna2VybmVsIC0tYXJjaD1yaXNjdiAtLWRl
ZmNvbmZpZwogIEdFTiAgICAgTWFrZWZpbGUKWy4uLl0KQ29uZmlndXJlZC4gIEJ1aWxkIHdpdGgg
J21ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSAtajQnCgok
IG1ha2UgQVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSAtajQKWy4u
Ll0KCiQgdmlydG1lLXJ1biAtLWtkaXI9LiAtLWFyY2g9cmlzY3Y2NCAtLW1vZHM9YXV0byAtLXJv
b3QgW3BhdGggdG8gYQpyaXNjdiBmaWxlc3lzdGVtXQoKVGhpcyBpcyB3aXRoIHZpcnRtZSBtYXN0
ZXIgYW5kIGEgcWVtdS1zeXN0ZW0tcmlzY3Y2NCBmcm9tIHFlbXUgZ2l0IG9uCm15IHBhdGguICBJ
dCBkb2VzICpub3QqIHdvcmsgd2l0aCBGZWRvcmEgMzAncyBxZW11LgoKU28gbm93IHlvdSBjYW4g
YWxsIGp1bXAgb24gdGhlIHZpcnRtZSBiYW5kd2Fnb24gYW5kIGhhdmUgYW4gZWFzeSB3YXkKdG8g
dGVzdCByaXNjdiBrZXJuZWxzLiA6KSAgQWx0aG91Z2gsIGlmIHlvdSB3YW50IHRvIHJ1biBrZXJu
ZWwKc2VsZnRlc3RzLCB5b3UgbWF5IGZpbmQgdGhlIHByb2Nlc3Mgb2YgYWN0dWFsbHkgcnVubmlu
ZyB0aGVtIHRvIGJlCm1vcmUgZnVuIGlmIHlvdSB1c2UgLS1yb2RpciBvciAtLXJ3ZGlyIHRvIG1h
cCB0aGUga2VybmVsIHNlbGZ0ZXN0cwpkaXJlY3RvcnkgaW50byB0aGUgZ3Vlc3QuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
