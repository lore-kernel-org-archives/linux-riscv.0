Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A30C3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szj2od0w+W0CfyMMnDVPlzjHyaIi7VwjdN4C5fIEpvk=; b=uvrJ4WFExLqx7v
	mOuncpBaftHThGnHmbrRP26VmdVjqzvoDG3LoxJJoeEQaBqLQ+Om8sQx3u+FPBBNTYaucg+ORRV5L
	FLtKIJgPBmQF4l+qocwYl0E9sOKSLf01gHOR/lnQugjwG2S3fq/nlxmE6qbESuQwxwO9cg0e1iv0u
	UwsK6sXTbLUxoQyDtQGWvW/TLHDYbF2Sjgz9i5bynaD7g4006s4v4eomY35svvEQ/FEO7N1wGCrm9
	gHUqMSzeEwQiCyD4A+yM7QEwvhBFb9iRUEV+0WO5v0OBic/09TCZla/YBmaSkZoRjUIqzORYSyV+1
	7UOeuHqXs+j53RUHHMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsjh-00000002P8c-2U3x;
	Fri, 02 May 2025 15:55:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsXy-00000002NHL-3XwZ
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 15:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F8A1A4C3AD;
	Fri,  2 May 2025 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43187C4CEE4;
	Fri,  2 May 2025 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746200609;
	bh=PaItWjYHU68Rvu/xvxI3f6ix8BVJ19mHeHVfLkaSsdA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MkmjeN3KNBGp/nvpHQT+G00nR7HO3/PS2cau7Gwc82eEO4oy2yV/Z6kdOWKa1GZWj
	 LOGK6QrNozcOBI3tFRA4HI9Jkhksi2kM/EPsVYMrOmHyM4MfGkP2g0CYvXfQMKq1qE
	 72v1+q8VABRsP7Ww0rMXQb6GjeBJsoxnouaW4k1bgqIAGGPfIJ+V3/bjYLzwpT9qhH
	 tMeF5hC2iuK9EC51ttERbSNEqfNRT5k5ApY7rupFlEVCqcQru5kANRPlnIqh/liwey
	 O3L3Pau0WBPbhIc0nLBkCQiAsQi0OgnqXz10ti7ElCFGyjK2+TgUWVcrJ9ypWsqat7
	 2UKLymflx5MuQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, Andrea
 Parri <parri.andrea@gmail.com>, Pu Lehui <pulehui@huawei.com>, Puranjay
 Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden
 <brho@google.com>, Neel Natu <neelnatu@google.com>, Benjamin Segall
 <bsegall@google.com>
Subject: Re: [PATCH bpf-next 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
Date: Fri, 02 May 2025 17:43:25 +0200
Message-ID: <87ldrfm31e.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_084330_948463_703BD5F0 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
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

QW5kcmVhL1BlaWxpbiEKClBlaWxpbiBZZSA8eWVwZWlsaW5AZ29vZ2xlLmNvbT4gd3JpdGVzOgoK
PiBIaSBhbGwhCj4KPiBQYXRjaHNldCBbMV0gaW50cm9kdWNlZCBCUEYgbG9hZC1hY3F1aXJlIChC
UEZfTE9BRF9BQ1EpIGFuZAo+IHN0b3JlLXJlbGVhc2UgKEJQRl9TVE9SRV9SRUwpIGluc3RydWN0
aW9ucywgYW5kIGFkZGVkIHg4Ni02NCBhbmQgYXJtNjQKPiBKSVQgY29tcGlsZXIgc3VwcG9ydC4g
IEFzIGEgZm9sbG93LXVwLCB0aGlzIHBhdGNoc2V0IHN1cHBvcnRzCj4gbG9hZC1hY3F1aXJlIGFu
ZCBzdG9yZS1yZWxlYXNlIGluc3RydWN0aW9ucyBmb3IgdGhlIHJpc2N2NjQgSklUCj4gY29tcGls
ZXIsIGFuZCBpbnRyb2R1Y2VzIHNvbWUgcmVsYXRlZCBzZWxmdGVzdHMvIGNoYW5nZXMuCgpUaGFu
a3MgYSBidW5jaCBmb3Igd29ya2luZyBvbiB0aGlzIQoKRm9yIHRoZSBzZXJpZXM6CkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4gIyBRRU1VL1JWQTIzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
