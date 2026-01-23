Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF274D77882
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpGgymQkQc0IZkeDPv6d89QOkyCSL9SZ4uWTeQcoaZU=; b=pnmiXbacsYvUnC
	fGgf/PKTth+SNhbNXY95/JYQCDRTohn5et8xpqXJKcX1LvLkbRLDBnPcbgFjWRttBwixi+K5/LZp6
	giHhstlw+pwVnPSDA3cgAeEvxd+WDPQ8dULMXvf7A++Roi/0c5I9n+VFNdUD74GDP2dFcQJ4Y6vQt
	6SnAfW3u3aeSW8ctiZ7tQqcKIu/gLmpMkjpueJNLxGeuGKiWFIOV91nDBFbmf0ABSE5tWmcbFpaWD
	t8PydfblJ89Ij28oshRL6Sy+2s1bZYzogj+Qsz/knHV587kcW/fNjn9NmteGhF95miEoWK1dj6op1
	6bHAY87NzW+gOp5Jo0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKK9-00000009DiX-0F0M;
	Fri, 23 Jan 2026 16:47:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKK5-00000009DhL-3pFI;
	Fri, 23 Jan 2026 16:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A625C4049C;
	Fri, 23 Jan 2026 16:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046ACC4CEF1;
	Fri, 23 Jan 2026 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186868;
	bh=zveMAUf998ovbct5UpW7FmMJgR9EwAhf7mycVOrHXT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpCvrKvle/wO3axQQk4cdWRkKypLm8st7IFY/YlpE8SKHScW1sSzzZR1zFMaANOQB
	 8K5ipExhGsMSuT+EMrydSDXe1a29fmQARcfM0SQrrYjxA6RvUuMtkYd/PwRasYADkO
	 FMVN1K53McrG3o1OnEFJOHZ8QK/2SDGXQTbGjlKjSa135KAqDoaHfmR402ZVpveUzv
	 9TtRI4qoddL8mVW7AUxFgF9Vui8WHHIWT5UoV+k1WXKsirGrhA6QkZqjEuzshYDYrF
	 X217jX9p4TVGQKEo/LKvtifEB/TSW+Ci6G5SGUh1TFuT3+Hrj94eMVSrxSjuRIYImK
	 Z26OO/WncgeBg==
Date: Fri, 23 Jan 2026 13:47:45 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>,
	Thomas Falcon <thomas.falcon@intel.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	Aditya Bodkhe <aditya.b1@linux.ibm.com>,
	Howard Chu <howardchu95@gmail.com>,
	Krzysztof =?utf-8?Q?=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Shimin Guo <shimin.guo@skydio.com>,
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
Message-ID: <aXOmMc8W85u-AGxH@x1>
References: <20260122213516.671089-1-irogers@google.com>
 <1310a240-077a-49f6-b83a-a8a4fd52127b@linaro.org>
 <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWrJoej0XprvPmYg5qa7SRU2s3yeCF-hWgj+3MTdTZLzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_084749_989940_BAF676D6 
X-CRM114-Status: GOOD (  14.77  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMDg6MzA6MjJBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBGcmksIEphbiAyMywgMjAyNiBhdCAzOjAy4oCvQU0gSmFtZXMgQ2xhcmsgPGphbWVz
LmNsYXJrQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gT24gMjIvMDEvMjAyNiA5OjM1IHBtLCBJYW4g
Um9nZXJzIHdyb3RlOgo+ID4KPiA+IFJldmlld2VkLWJ5OiBKYW1lcyBDbGFyayA8amFtZXMuY2xh
cmtAbGluYXJvLm9yZz4KPiAKPiBUaGFua3MgSmFtZXMhCj4gCj4gQXJuYWxkbywgaXQnZCBiZSBu
aWNlIGZvciB0aGlzIHRvIGxhbmQgc28gSSBjYW4gbG9vayBpbnRvIGFkZHJlc3NpbmcKPiB0aGUg
bWlzc2luZyBlX2ZsYWdzIGlzc3VlIC0gbmFtZWx5LCB3ZSBzaG91bGQgb3B0aW9uYWxseSByZWFk
IHRoZQo+IGVfZmxhZ3MgYWxvbmcgd2l0aCB0aGUgZV9tYWNoaW5lIHNvIHRoYXQgd2UgaGF2ZSBh
IHByb3BlciBlX2ZsYWdzCj4gdmFsdWUgdG8gbWFrZSBjc2t5IHdvcmsgcHJvcGVybHkgKG5vdCBh
biBpc3N1ZSBvbiBhbnl0aGluZyBlbHNlKS4gQXQKPiB0aGUgc2FtZSB0aW1lIEkgdGhpbmsgc29t
ZSBvZiB0aGUgZV9tYWNoaW5lIHNob3VsZCBiZSBtYWRlIG1vcmUgcm9idXN0Cj4gbGlrZSB3aXRo
Ogo+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9w
ZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvY29tbWl0L3Rvb2xzL3BlcmY/aD1wZXJmLXRvb2xzLW5l
eHQmaWQ9ZTk5ZDU0NGM3ZjM2OTFlYjMyMWM4OGZkYmFkZjA0Yjc3N2MxMTRjNAo+IGJ1dCBoZXJl
Ogo+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9w
ZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwvdGhyZWFkLmM/aD1w
ZXJmLXRvb2xzLW5leHQjbjQ1Mgo+IHRoZSBjb2RlIHNob3VsZCBwcm9iYWJseSBiZSBzaGFyZWQu
Cj4gQW55d2F5LCB0aGlzIHNlcmllcyBkb2VzIGVub3VnaCB3aXRob3V0IGFkZGluZyBhbGwgdGhh
dCB0byBpdCBhbmQKPiB3YWl0aW5nIGZvciBtb3JlIHRhZ3MuCgpJIGp1c3QgbWVyZ2VkIGl0IGFu
ZCBpdCBpcyBnb2luZyBvbiB0ZXN0aW5nLCBJJ2xsIGFsc28gY2hlY2sgdGhhdCBmaXgKZm9yIHRo
ZSBpbmplY3QgY2FsbGNoYWluIG9uIGh5YnJpZCBzaW5jZSBJIG5vdGljZWQgaXQgZmFpbGluZyBo
ZXJlIGFzCndlbGwuCgpUaGFua3MsCgotIEFybmFsb2QKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
