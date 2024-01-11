Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4A0C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0kbrzeITPIJf3UhbqzLjmauu/QUdlpD9Yj7MomThcA=; b=qBQNqWoEHSOp4B
	GP85FPaBEWk9/FqzEspdt+DbQ//prOysWVIgDKrfPMddZ0sqc1B42+wsTV+79mXIaPTZ3W0mPvSwk
	07heAukaf6h2CfHHGNBK6YM4CPH6dH+bGydl9xbhIP999wOyxE41LCPz13yO80IXUoM+at3iHu8Vc
	e5WT388zMRRKlpzuOZ1V1XwTwOmYKy9dVkKcBU7EH0sTAjbb0coOTw/rv3qk6RMu1R4Ydf8PSj02k
	+tKm8JedtZW1Bafy127M309toAi7bauCouadjguFmt53Ns22Rwa5jfsy09UfxWPDTaKy/j8sgtOiz
	N0kEcrxmgkwI5la3GCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1En-0013I6-1x;
	Thu, 11 Jan 2024 20:01:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1Ei-0013FG-0W;
	Thu, 11 Jan 2024 20:01:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40e62425c60so6051145e9.3;
        Thu, 11 Jan 2024 12:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003262; x=1705608062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
        b=nQDSLD/A8uPbAJMxlSyvUASualBp4Lh2mAeZM0nWJCZlb80CCmlNQbEI8mz6Rxa1tG
         4VdEt7IvD1ehRIOOLjjgnzeN+56X3laXuVP85wyRbizepXAi5g/n8lnxm3b7ak6Wcd87
         NHVc5Lo8mMSRZiT+kg/PnT2OTalGGCklFKqFIk7z+c+v672jnIvc00qlJT/IdbgzJ2gN
         JshEQQ4VcCxCJdPKH0XaDDKT5tv6V1/X7a3J4IJUoA9ilyTumRmtPzhemXYoLskQGDD9
         S4nychbKNyFRVljCvrTZmjTWjuN0474bAGSBL5lO9zIuzLyuKzn8bRE/e1tTHxAY0lyy
         n99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003262; x=1705608062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAL60ZiXYTrQWwc6XvTjBF7mU0s/R7MUfIaHS38evWw=;
        b=MuzvBUkEJCTzuPiAUi6+4KUkKEAMu4AvGieXLysDmy/qtv+7CSir2ZAPe5xQ85kf/o
         uarmZ8hD8mQJVTc9/ydt070JmXfRRU+6EQP4Nyqdi25imGOHuFOv69co3hIokA3ri9gU
         YPzxK1tY8EvEjWFmWOiagw5owuXgiAM68tph82ZO/rbbwtCTRjmFuuYp2BUC+MgoEYCj
         aNPkEiaOB9bkGi2aQWUSD2CChBz3w6NZaX/okxHj7tMvh9BRXAgWS3StyDWsh3anOYhR
         QKNpfuiU9paTUEvxMzMEOl3iLDHJJ645WOmBgmZQWPac6uRgVwzIXkkjcXv5evDEhDrr
         6p7Q==
X-Gm-Message-State: AOJu0Yzi0XPJSGBvgKuyE20yt3/r5939ZtZ/jIuIGEn6qqy1jl0j9cQp
	/9Rc0bbBEdeWBjbToV+X5pdCq1wt6bvMVNfZp04muWAX
X-Google-Smtp-Source: AGHT+IEuD70YW9odmSJBW0ovp3CIEuHoCB7eupgpN0U69zefCCa6AEpsUHBsIEtkfYtc2dUZae2qy6ZzWQ5YfFTTiDA=
X-Received: by 2002:a05:600c:6548:b0:40e:52a7:ac58 with SMTP id
 dn8-20020a05600c654800b0040e52a7ac58mr243439wmb.65.1705003261872; Thu, 11 Jan
 2024 12:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-1-eb09b59db071@kernel.org> <6a655e9f-9878-4292-9d16-f988c4bdfc73@linux.dev>
 <20240111194001.GA3805856@dev-arch.thelio-3990X>
In-Reply-To: <20240111194001.GA3805856@dev-arch.thelio-3990X>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 11 Jan 2024 12:00:50 -0800
Message-ID: <CAADnVQKFv2DKE=Um=+kcEzSWYCp9USQT_VpTawzNY6eRaUdu5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] selftests/bpf: Update LLVM Phabricator links
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	clang-built-linux <llvm@lists.linux.dev>, patches@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-trace-kernel@vger.kernel.org, 
	linux-s390 <linux-s390@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>, bridge@lists.linux.dev, 
	Network Development <netdev@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_120108_203432_DECF759A 
X-CRM114-Status: GOOD (  20.92  )
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

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMTE6NDDigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgWW9uZ2hvbmcsCj4KPiBPbiBXZWQsIEphbiAx
MCwgMjAyNCBhdCAwODowNTozNlBNIC0wODAwLCBZb25naG9uZyBTb25nIHdyb3RlOgo+ID4KPiA+
IE9uIDEvOS8yNCAyOjE2IFBNLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+ID4gcmV2aWV3
cy5sbHZtLm9yZyB3YXMgTExWTSdzIFBoYWJyaWNhdG9yIGluc3RhbmNlcyBmb3IgY29kZSByZXZp
ZXcuIEl0Cj4gPiA+IGhhcyBiZWVuIGFiYW5kb25lZCBpbiBmYXZvciBvZiBHaXRIdWIgcHVsbCBy
ZXF1ZXN0cy4gV2hpbGUgdGhlIG1ham9yaXR5Cj4gPiA+IG9mIGxpbmtzIGluIHRoZSBrZXJuZWwg
c291cmNlcyBzdGlsbCB3b3JrIGJlY2F1c2Ugb2YgdGhlIHdvcmsgRmFuZ3J1aQo+ID4gPiBoYXMg
ZG9uZSB0dXJuaW5nIHRoZSBkeW5hbWljIFBoYWJyaWNhdG9yIGluc3RhbmNlIGludG8gYSBzdGF0
aWMgYXJjaGl2ZSwKPiA+ID4gdGhlcmUgYXJlIHNvbWUgaXNzdWVzIHdpdGggdGhhdCB3b3JrLCBz
byBwcmVlbXB0aXZlbHkgY29udmVydCBhbGwgdGhlCj4gPiA+IGxpbmtzIGluIHRoZSBrZXJuZWwg
c291cmNlcyB0byBwb2ludCB0byB0aGUgY29tbWl0IG9uIEdpdEh1Yi4KPiA+ID4KPiA+ID4gTW9z
dCBvZiB0aGUgY29tbWl0cyBoYXZlIHRoZSBjb3JyZXNwb25kaW5nIGRpZmZlcmVudGlhbCByZXZp
ZXcgbGluayBpbgo+ID4gPiB0aGUgY29tbWl0IG1lc3NhZ2UgaXRzZWxmIHNvIHRoZXJlIHNob3Vs
ZCBub3QgYmUgYW55IGxvc3Mgb2YgZmlkZWxpdHkgaW4KPiA+ID4gdGhlIHJlbGV2YW50IGluZm9y
bWF0aW9uLgo+ID4gPgo+ID4gPiBBZGRpdGlvbmFsbHksIGZpeCBhIHR5cG8gaW4gdGhlIHhkcHdh
bGwuYyBwcmludCAoIkxMTVYiIC0+ICJMTFZNIikgd2hpbGUKPiA+ID4gaW4gdGhlIGFyZWEuCj4g
PiA+Cj4gPiA+IExpbms6IGh0dHBzOi8vZGlzY291cnNlLmxsdm0ub3JnL3QvdXBkYXRlLW9uLWdp
dGh1Yi1wdWxsLXJlcXVlc3RzLzcxNTQwLzE3Mgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gQWNrIHdpdGggb25lIG5pdCBi
ZWxvdy4KPiA+Cj4gPiBBY2tlZC1ieTogWW9uZ2hvbmcgU29uZyA8eW9uZ2hvbmcuc29uZ0BsaW51
eC5kZXY+Cj4KPiA8c25pcD4KPgo+ID4gPiBAQCAtMzA0LDYgKzMwNCw2IEBAIGZyb20gcnVubmlu
ZyB0ZXN0X3Byb2dzIHdpbGwgbG9vayBsaWtlOgo+ID4gPiAgIC4uIGNvZGUtYmxvY2s6OiBjb25z
b2xlCj4gPiA+IC0gIHRlc3RfeGRwd2FsbDpGQUlMOkRvZXMgTExWTSBoYXZlIGh0dHBzOi8vcmV2
aWV3cy5sbHZtLm9yZy9EMTA5MDczPyB1bmV4cGVjdGVkIGVycm9yOiAtNDAwNwo+ID4gPiArICB0
ZXN0X3hkcHdhbGw6RkFJTDpEb2VzIExMVk0gaGF2ZSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9s
bHZtLXByb2plY3QvY29tbWl0L2VhNzJiMDMxOWQ3YjBmMGMyZmNmNDFkMTIxYWZhNWQwMzFiMzE5
ZDU/IHVuZXhwZWN0ZWQgZXJyb3I6IC00MDA3Cj4gPiA+IC1fXyBodHRwczovL3Jldmlld3MubGx2
bS5vcmcvRDEwOTA3Mwo+ID4gPiArX18gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9q
ZWN0L2NvbW1pdC9lYTcyYjAzMTlkN2IwZjBjMmZjZjQxZDEyMWFmYTVkMDMxYjMxOWQKPiA+Cj4g
PiBUbyBiZSBjb25zaXN0ZW50IHdpdGggb3RoZXIgbGlua3MsIGNvdWxkIHlvdSBhZGQgdGhlIG1p
c3NpbmcgbGFzdCBhbG51bSAnNScgdG8gdGhlIGFib3ZlIGxpbms/Cj4KPiBUaGFua3MgYSBsb3Qg
Zm9yIGNhdGNoaW5nIHRoaXMgYW5kIHByb3ZpZGluZyBhbiBhY2suIEFuZHJldywgY291bGQgeW91
Cj4gc3F1YXNoIHRoaXMgdXBkYXRlIGludG8gc2VsZnRlc3RzLWJwZi11cGRhdGUtbGx2bS1waGFi
cmljYXRvci1saW5rcy5wYXRjaD8KClBsZWFzZSBzZW5kIGEgbmV3IHBhdGNoLgpXZSdkIGxpa2Ug
dG8gdGFrZSBhbGwgYnBmIHBhdGNoZXMgdGhyb3VnaCB0aGUgYnBmIHRyZWUgdG8gYXZvaWQgY29u
ZmxpY3RzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
