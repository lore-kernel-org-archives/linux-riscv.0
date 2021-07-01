Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F32AC11F68
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E3F61468
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E3F61468
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hdQOG8ssGaJBnwsxxS49NyclRMVgKqVgbG2dvM8tg0=; b=cnNz2lzzva93fg
	Mp8V152lWky3NBddfY2NPBE83BJWiXKNQWIPmlzpHZvZ/p1Ho3pInaTqnLjxO0B84ktv6n900+NvU
	nMGVXz7zY/lJqCw3HRU1AbjugJwYKJcjyWs0+QVv4OgDOKZNwuM3QDTRzGXL880xQqtZj4+EATJA3
	bQaw6jwm9BwmT2I7IAeNiRz9VbiHXQPIWnWbDeX5aXRCT/AWr27MD2vv74f3ajMYwY2C2ovHz284K
	b0+sDaQCyf0VnB0tiva7jEaWTpSzNA/5TDirefjS5BgxOlpOzzqDwazXxknIpqoUkizxmCITdQRRF
	P7MgKw2uHVto3CdOh/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymK6-00Ft5J-5b; Thu, 01 Jul 2021 02:21:02 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymK3-00Ft4U-6F
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:21:00 +0000
Received: by mail-yb1-xb35.google.com with SMTP id p22so8351616yba.7
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BZiA++i9/HIlLMmgO3JxJDUc1Suj7A+dnaQIqqLWGAY=;
 b=F6VOyj/xRpKG8vkwDSYJ6vYzHOcMY10qBExtNVeMavmRa6iWqczKrXubuAEQwXWeeD
 8M3ITL3Edtxk+XiqTiP+5eMyRz68QBklfWmmvgXpPY9P2wgVS/JWvUM27EL7ANGVxi/B
 WCA+2OMRQJk/4klXovHBjNiChdj9lsdn9gTkGZLDlhOpHQ1GpKhL4UBGM+7zcEJgTG6T
 jF5ijbRvDVxNqQMFQMchkIr2WcxQjZcqFmPGgO9joEqwFcT5LS03hqy/6q1FVRjYqoDv
 b6qKKlYMeMF7cDEygCOAn/EqpMCHvJu3DIMIPW0FioUewqo1bD00BOeN9PR63wagc3Mh
 H98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BZiA++i9/HIlLMmgO3JxJDUc1Suj7A+dnaQIqqLWGAY=;
 b=Y7Or7TH+9GALTqwCiP7w61eEI3SogWZJn7PrFGpITV2NMQ++0r/uQjxtQ2p0ShnFSl
 RPh05/urP0K6NVfyWtoikrmQAAcf/dm7iF2uFuL6reYjdl8q5cW5pkE7OsXqDUwpA5Qu
 weFrb7kZ6Rv+JshWrwYuj9xh4jEgidQk2wAcnHP+if+wnmNwHXNJi0mpizAPVcmaEAG7
 DpwUREwWMOuZYrqsKC3hLYtYkYHOX8HDHDEGI+4ctCB5mexnnz+KNGNNEkIw+lNY6ES5
 VqhjB3FF2zhLGzENOiUM7Tmk6HpICg9iv+s7YjdKi0mO0woLSyovOMQenPw15XCciDFd
 9qjw==
X-Gm-Message-State: AOAM531JrdrmlckHYxnoZCkWeeHp6GLeOI+KdLCgqhxDv7orEyTEBBCd
 pKDgFgUOwiMYH5eMLm9ZpGjcKdO5sz27GBDxezQ=
X-Google-Smtp-Source: ABdhPJx2HrcgpI89x1MjAJexBzDBDQZ5RK4uKgnHTnFzxyXiY5tY/psMDBGCM42IuoX4HT8HMB9caavbBmji/N8HU+A=
X-Received: by 2002:a25:b7cd:: with SMTP id u13mr28799996ybj.152.1625106057861; 
 Wed, 30 Jun 2021 19:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
 <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
 <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
 <94a92009-ce49-bbe4-794c-0631520e4c3d@huawei.com>
In-Reply-To: <94a92009-ce49-bbe4-794c-0631520e4c3d@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 1 Jul 2021 10:20:46 +0800
Message-ID: <CAEUhbmX8a+rjc4=5QfR4MivMMx-T_7KDq-QHtmrGsVL2VqLQAA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_192059_288193_490FC158 
X-CRM114-Status: GOOD (  25.12  )
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

T24gVGh1LCBKdWwgMSwgMjAyMSBhdCAxMDowOCBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPiBPbiAyMDIxLzYvMzAgMTk6NTgsIEJpbiBNZW5n
IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMTE6MjEgQU0gQmluIE1lbmcgPGJt
ZW5nLmNuQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4gT24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMTA6
MjggQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+
Pj4KPiA+Pj4gT24gMjAyMS82LzI4IDk6MTUsIEJpbiBNZW5nIHdyb3RlOgo+ID4+Pj4gT24gTW9u
LCBKdW4gMjgsIDIwMjEgYXQgODo1MyBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+ID4+Pj4+IEhp77yMIHNvcnJ5IGZvciB0aGUgbWlzdGFrZe+8jHRo
ZSBidWcgaXMgZml4ZWQgYnkKPiA+Pj4+Pgo+ID4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjEwNjAyMDg1NTE3LjEyNzQ4MS0yLXdhbmdrZWZlbmcud2FuZ0BodWF3
ZWkuY29tLwo+ID4+Pj4gV2hhdCBhcmUgd2Ugb24gdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ/Cj4g
Pj4+Pgo+ID4+Pj4gSSBkb24ndCBzZWUgaXQgYXBwbGllZCBpbiB0aGUgbGludXgvbWFzdGVyLgo+
ID4+Pj4KPiA+Pj4+IEFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVzIiB0YWcgYW5kIHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcgY2MnZWQKPiA+Pj4+IGJlY2F1c2UgMzItYml0IGlzIGJyb2tlbiBz
aW5jZSB2NS4xMi4KPiA+Pj4gaHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXgvKy9jOTgxMWUzNzliMjExYzY3YmEyOWZiMDlk
NmY2NDRkZDQ0Y2ZjZmYyCj4gPj4+Cj4gPj4+IGl0J3Mgb24gUGFsbWVyJyByaXNjdi1uZXh0Lgo+
ID4+IE5vdCBzdXJlIHJpc2N2LW5leHQgaXMgZm9yIHdoaWNoIHJlbGVhc2U/IFRoaXMgaXMgYSBy
ZWdyZXNzaW9uIGFuZAo+ID4+IHNob3VsZCBiZSBvbiA1LjEzLgo+ID4+Cj4gPj4+IEhpIFBhbG1l
ciwgc2hvdWxkIEkgcmVzZW5kIG9yIGNvdWxkIHlvdSBoZWxwIG1lIHRvIGFkZCB0aGUgZml4ZXMg
dGFnPwo+ID4gWW91ciBwYXRjaCBtaXhlZCAyIHRoaW5ncyAoZml4IHBsdXMgb25lIGZlYXR1cmUp
IHRvZ2V0aGVyLCBzbyBpdCBpcwo+ID4gbm90IHByb3BlciB0byBiYWNrIHBvcnQgeW91ciBwYXRj
aC4KPgo+ICJtZW09IiB3aWxsIGNoYW5nZSB0aGUgcmFuZ2Ugb2YgbWVtYmxvY2ssIHNvIHRoZSBm
aXggcGFydCBtdXN0IGJlIGluY2x1ZGVkLgo+CgpZZXMsIHNvIHlvdSBjYW4gcmViYXNlIHRoZSAi
bWVtPSIgY2hhbmdlcyBvbiB0b3Agb2YgbXkgcGF0Y2guCgpUaGUgcHJhY3RpY2UgaXMgdGhhdCB3
ZSBzaG91bGQgbm90IG1peCAyIHRoaW5ncyBpbiBvbmUgcGF0Y2guIEkgY2FuCmltYWdpbmUgdGhh
dCB5b3Ugd2FudGVkIHRvIGFkZCAibWVtPSIgdG8gUklTQy1WIGFuZCBzdWRkZW5seSBmb3VuZCB0
aGUKZXhpc3RpbmcgbG9naWMgd2FzIGJyb2tlbiwgc28geW91IHNlbnQgb25lIHBhdGNoIHRvIGRv
IGJvdGguCgo+Cj4gPgo+ID4gSGVyZSBpcyBteSAyIGNlbnRzOgo+ID4KPiA+IDEuIERyb3AgeW91
ciBwYXRjaCBmcm9tIHJpc2N2LW5leHQKPiA+IDIuIEFwcGx5IG15IHBhdGNoIGFzIGl0IGlzIGEg
c2ltcGxlIGZpeCB0byBwcmV2aW91cyBjb21taXQuIFRoaXMKPiA+IGFsbG93cyBzdGFibGUga2Vy
bmVsIHRvIGNoZXJyeS1waWNrIHRoZSBmaXggdG8gdjUuMTIgYW5kIHY1LjEzLgo+ID4gMy4gUmVi
YXNlIHlvdXIgcGF0Y2ggYWdhaW5zdCBtaW5lLCBhbmQgcmVzZW5kIHYyCj4gPgo+ID4gTGV0IG1l
IGtub3cgaWYgdGhpcyBtYWtlcyBzZW5zZS4KPgo+IEl0IGlzIG5vdCBhIGJpZyBwcm9ibGVtIGZv
ciBtZSwgYnV0IEkgaGF2ZSBubyByaWdodCBhYm91cnQgcmlzY3YtbmV4dCwKPgo+IGxldCdzIHdh
aXQgUGFsbWVyJ3MgYWR2aXNlLgo+CgpTdXJlLiBQYWxtZXIsIGxldCBtZSBrbm93IHlvdXIgdGhv
dWdodHMuCgpSZWdhcmRzLApCaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
