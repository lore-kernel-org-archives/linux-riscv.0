Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC0EB64D7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 00:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7iTDzxUOjb3eFJMims6UfupnpeB+eyd+q9ghufXNmA=; b=3hQWlgcC3FMDqf
	ei9IT1SRzRWUV/G6U8LKF8lM2kcpH+rjeidGFxoxwai6TOmb0gvoNNX3m8dFuBIEab3eNMnvCnD/X
	xmfmwsyruYJPeQGgNzzkPtVnEZtPxfMy5lJSLCtrcqFq7NboPho+Nlf31EjGweMlcJ5MR+CnvYTdm
	SrhGFEhBUodgRtfQBbV1COnTAQRcA3eNtiwKNqt+XYuRYf1HjKZHDDSR8fU29whCCMgbbSFC6EcII
	V3jIOJSehRTCXE7kR+vlAfAmm41Maf4BYCybjMAGJpafVcXuEkUcURZ8LlMvRT5YeTz4JOnzLfphU
	doT5XsFNSTEd8ajVjnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqyO-004uM3-2k;
	Sat, 24 Jun 2023 00:17:52 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqyM-004uKn-2C
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 00:17:51 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bc43a73ab22so1974963276.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 17:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687565867; x=1690157867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hPv8x0shEc/k1aN0by01gtPFzohHEguHvDTQ7Gv+Rw=;
        b=g1awNoYd/VjhPUisvGmnL5DXX8RaTC6o3E/R3VwXYBKkopOsXlyWzYQGS30xOPlWF9
         RzEUG+myZ1fHa2IQ+INlYYDa80XLwaWO7qQx5ThIKE2Z1wd2eyu+xAoeJ7e8lnzuB5W3
         z+XGLtgVNa9Rbukft27rlCu53acNVRQBdx+mvbLs3LatU07rhw87zYjkyfFQ4goLL1+u
         Y2VXN8sGO1lYHautnGXJMFc6yr6Iruc6X9MTITh3QX6AmuV/sBEFzrWLAvDSVm8BkpLf
         8eioPXWuUMIwOaYT7NByJaCfI8ZkKnkfaSbtp7tsPMTQHwk2NGCgW1YdbP6Qgp3GUdhS
         H23w==
X-Gm-Message-State: AC+VfDzJUK+abligg8MhYHuGuqfd918+9Wp7ynUXhA5XNFS5QKZNuINH
	77ZMl/llnCAvPQieTVN4FwcsqMxXwC5gKJpTRDo=
X-Google-Smtp-Source: ACHHUZ6l3TbHPX8wI1PbnOY0McB4XZDCxRwUFIviGRz4FHEneTHHeSQaYtHtraYCmbboUltMOGHqhaF47c92hM7Zwlc=
X-Received: by 2002:a25:6a43:0:b0:ba8:2a74:155 with SMTP id
 f64-20020a256a43000000b00ba82a740155mr21475536ybc.32.1687565866927; Fri, 23
 Jun 2023 17:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <36fcef74ba3d21250f4c9605e691d1e2dac20ebb.camel@maquefel.me> <IA1PR20MB4953FCC20C89F2659EB34896BB7F9@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953FCC20C89F2659EB34896BB7F9@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 23 Jun 2023 17:17:35 -0700
Message-ID: <CAM9d7cjtisDVPijfU=iEGxc0YF=RnAt+r18Jg+8Av-+RAO=jeg@mail.gmail.com>
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nikita Shubin <n.shubin@yadro.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_171750_721531_95445C16 
X-CRM114-Status: GOOD (  14.25  )
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

SGVsbG8sCgpPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAyOjUw4oCvQU0gSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQG91dGxvb2suY29tPiB3cm90ZToKPgo+ID4gbGljaGVlcnYgIyBwZXJmIHJlY29y
ZAo+ID4gWyAgNDMyLjAxNTYxOF0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMCBz
dHVjayBmb3IgMjZzIQo+ID4gW3BlcmY6MTE3XQo+ID4gWyAgNDYwLjAxNTYxN10gd2F0Y2hkb2c6
IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMCBzdHVjayBmb3IgNTJzIQo+ID4gW3BlcmY6MTE3XQo+
ID4gWyAgNDg4LjAxNTYxNl0gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMCBzdHVj
ayBmb3IgNzhzIQo+ID4gW3BlcmY6MTE3XQo+ID4gWyAgNTE2LjAxNTYxN10gd2F0Y2hkb2c6IEJV
Rzogc29mdCBsb2NrdXAgLSBDUFUjMCBzdHVjayBmb3IgMTA0cyEKPiA+IFtwZXJmOjExN10KPiA+
Cj4gPiBCdXQgdGhhdCdzIG5vdCByZWxhdGVkIHRvIHlvdXIgcGF0Y2ggYW55d2F5Lgo+Cj4gU2Ft
ZSBpc3N1ZSBvbiBjOTIwLCBidXQgaXQgZGlkIG5vdCBhbHdheXMgb2NjdXIuCj4gTGlrZSBhIHNi
aSBpc3N1ZSBmb3IgVC1IRUFEIGNwdXMuCj4KPiA+IEkgYW0gc3Ryb25nbHkgYWdhaW5zdCB1c2lu
ZyAiYzl4eCIgd2lsZGNhcmQsIGkgd291bGQgcHJlZmVyIGRlY2xhcmluZwo+ID4gdGhlbSBzZXBh
cmF0ZSAoZXNwZWNpYWxseSB0YWtpbmcgaW4gbWluZCB0aGF0IGM5MjAgaXMgYzkxMCB3aXRoIHZl
Y3Rvcgo+ID4gLSBBRkFJSyksIGJ1dCB0aGF0J3MgdXAgdG8gQXJuYWxkbyB0byBkZWNpZGUuCj4K
PiBBRkFJSywgdGhlcmUgaXMgbm8gcmVsaWFibGUgd2F5IHRvIGRpc3Rpbmd1aXNoIGM5MDYgYW5k
IGM5MTAgY29yZXMuIEFuZAo+IHRoZSBldmVudHMgb2YgYzkxMCBhbmQgYzkyMCBhcmUgdGhlIHNh
bWUgKGFjY29yZGluZyB0byB0aGUgZHJhZnQgZG9jdW1lbnQKPiBvZiB0aGUgYzkyMCkuCj4KPiBB
bnl3YXksIEkgYWdyZWUgdG8gbGV0IEFybmFsZG8gZGVjaWRlLgo+Cj4gPiBUZXN0ZWQtYnk6IE5p
a2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJvLmNvbT4KCkknbSBjb2xsZWN0aW5nIHBhdGNoZXMg
b24gYmVoYWxmIG9mIEFybmFsZG8gdGhpcyB0aW1lLgpJdCBzZWVtcyB0aGlzIHBhdGNoIHdhcyBu
b3QgcGlja2VkIHVwIGZvciBhIGxvbmcgdGltZS4KCkkgdGhpbmsgd2UgY2FuIG1ha2UgY2hhbmdl
cyBmb3IgdGhlIGM5eHggd2lsZGNhcmQgbGF0ZXIKaWYgbmVlZGVkLiAgSSdsbCBwcm9jZXNzIGl0
IGluIHRoZSBjdXJyZW50IGZvcm0uCgpUaGFua3MsCk5hbWh5dW5nCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
