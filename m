Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAC8D59F75
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDIghadWw/ZiYC7B1W/x5oIz5IwJJaTUIOOwzWbO8ls=; b=JTZTN2tZgt+ou0
	MICRu47h+einzittIxP4FWHQnf/guF5aQOGzYM5OnlCUvnQxyPenhmdnTgRsNB6hsc5ryTeAZD1YR
	GRX5LDNsoPcyEchxtVwcojkliNvZ5P9NOiJUi/nFoua7/F8tIoV/WbMl9sXscvQ0BmI1HJ/nptuZl
	vJTh6BFAbEgH7mcZEC/hm23xNNNMausVOEmpRQnrVcxlZoFjcdkt+Ug6tZAOsJerUsANK/GKedfDR
	3Jcy924q2NQO+oNk//TQWfhkB92CiIMBtjmznBCz58J98XfFkHx8tWtCx4g6bhiO8YSfznvwQawEm
	52508Ej/jPkoq+W9Sb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o8Q-00000004rYe-1qge;
	Wed, 06 Nov 2024 22:04:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o8N-00000004rXK-088R
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 22:04:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso234447a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 14:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730930653; x=1731535453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfGNi4Eab08D4rDIFJXSfdEQm138IE7MugUyEGUzqSg=;
        b=MSdXTbbzU+U0l5bgdrsLTAPWduKno4J5IOL/TDhLwC5kwwAMW5GxKfUtLhyMxYwN6m
         TiBy3ReY8qc7HBcxGN5qWzhKIWiuigSOgsnFnT1GArdyz7LfLI88AhoADZ6mAxMvHRw9
         qZI3Q5Lu7oZimb6pZanPo5wpnsmT4Cx2925InaWg5Q6v5oLhidrmyuXUa5LUx2sWg2T2
         6Xmqv/ehU1gxmhGIpBBiSUCH1ucSGYwcm3q2lprl6VMaptBr95coyvQBQqLUpEz0fQV7
         msYHL7rXYzqzqDxcXUfY2xMfNsuSnZZtx6FlQKw519QVcATkiYTyIs6rLOWvdHGuzpY7
         isrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930653; x=1731535453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfGNi4Eab08D4rDIFJXSfdEQm138IE7MugUyEGUzqSg=;
        b=fV/+fLgJny4L9K2YPeQ2j3irXdWYuiYyyxyWEZWBtn4a9FEdoXdlWCKjVHeT2RQ2ye
         2GeDA9gAYG2R96EbeKUcErVtc77gQyvR8sGni/A9W7FnBguMB+V6f58YIZMwAil+GG8o
         Fp4/6fvvksTd2eTFy6X6Se+AAPyVCqOaKVgHgQWxCu8nLBP62ONNa/A+ckkZ68bFrGsk
         IGsCgTtIB2hkw1d+nHAXhCnAipSPzcAbTpWhNMmmda+He1z4TTbGFdjFw2TidVH5JhDZ
         DWzKBPY/LEd00bxcWpXLXZiq8ElQWoIn5V1ZQsabUxLObXlLBcDmhvaPXohAzQOLtc6W
         wcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoib3a9TXkx3q2CQg5rEOANI8Iw2TFAfY47ShK9J52gZoqSLlkxKCN+LDGqcXQmkr30PART198Bi6atw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXwK9vuyyddh62/vSm9p16STSVboN2wYGmhewRWmxblF6oeOP
	TcgAxbsHJ8A7eTBV6yGa6XprA2E3zBWG2Tdsli+bFw9dcvrbO3HHryjgXZVLkueAjePb6pcM1en
	6gWeBEscMQ9xXwnEAZMXvmkBHE2c=
X-Google-Smtp-Source: AGHT+IHiIFN3vV3i+lrEACl/mdE0HQWZtzx800XFbju733sBmVhjjP4bbDv2RZKt8j7XpLWja7xZVa0f8ftoFXrmJPw=
X-Received: by 2002:a17:90b:4a49:b0:2e2:b64e:f506 with SMTP id
 98e67ed59e1d1-2e94c2afe78mr30385346a91.13.1730930653594; Wed, 06 Nov 2024
 14:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org> <172835823300.66789.3704854116445399222.git-patchwork-notify@kernel.org>
 <87bjyvpa6h.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87bjyvpa6h.fsf@all.your.base.are.belong.to.us>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 6 Nov 2024 14:04:01 -0800
Message-ID: <CAEf4BzZbq9OwSGi4pdb5_q8YkErfFiQFKYXg3g1rjpdejafx+Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, andrii@kernel.org, eddyz87@gmail.com, 
	mykolal@fb.com, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	bjorn@rivosinc.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	charlie@rivosinc.com, Andreas Schwab <schwab@suse.de>, Anand Moon <linux.amoon@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_140415_097150_81C4D815 
X-CRM114-Status: GOOD (  19.00  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAyOjI24oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBwYXRjaHdvcmstYm90K25ldGRldmJwZkBrZXJuZWwub3JnIHdy
aXRlczoKPgo+ID4gSGVsbG86Cj4gPgo+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gYnBm
L2JwZi1uZXh0LmdpdCAobWFzdGVyKQo+ID4gYnkgQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2Vy
bmVsLm9yZz46Cj4gPgo+ID4gT24gRnJpLCAyNyBTZXAgMjAyNCAxNToxMzo1MiArMDIwMCB5b3Ug
d3JvdGU6Cj4gPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4+
Cj4gPj4gbGliYnBmIGRvZXMgbm90IGluY2x1ZGUgdGhlIHBlci1hcmNoIHRvb2xzIGluY2x1ZGUg
cGF0aCwgZS5nLgo+ID4+IHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS4gU29tZSBhcmNoaXRlY3R1
cmVzIGRlcGVuZCB0aG9zZSBmaWxlcyB0bwo+ID4+IGJ1aWxkIHByb3Blcmx5Lgo+ID4+Cj4gPj4g
SW5jbHVkZSB0b29scy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUgbGliYnBmIGJ1aWxk
Lgo+ID4+Cj4gPj4gWy4uLl0KPiA+Cj4gPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6
Cj4gPiAgIC0gW2JwZi1uZXh0LDEvMl0gbGliYnBmOiBBZGQgbWlzc2luZyBwZXItYXJjaCBpbmNs
dWRlIHBhdGgKPiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzcx
MGZiY2E4MjBjNwo+ID4gICAtIFticGYtbmV4dCwyLzJdIHNlbGZ0ZXN0czogYnBmOiBBZGQgbWlz
c2luZyBwZXItYXJjaCBpbmNsdWRlIHBhdGgKPiA+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2JwZi9icGYtbmV4dC9jLzE5MDkwZjAzMDZmMQo+Cj4gQW5kcmlpLCBJIGp1c3Qgbm90ZWQgdGhh
dCB0aGlzIGxhbmRlZCBpbnRvIGJwZi1uZXh0LCBhbmQgbm90IGJwZgo+IChmaXhlcykuCgpIaSBC
am9ybiwKClllcywgbGliYnBmIGFuZCBzZWxmdGVzdHMgZml4ZXMgYXJlIGdlbmVyYWxseSBhcHBs
aWVkIHRocm91Z2gKYnBmLW5leHQsIHVubGVzcyB0aGUgaXNzdWUgaXMgcHJldHR5IGJhZCBhbmQg
aW1tZWRpYXRlLgoKSSdtIHNvcnJ5LCBidXQgdW5mb3J0dW5hdGVseSBpdCdzIHRvbyBsYXRlIG5v
dyB0byBtb3ZlIHRob3NlIHBhdGNoZXMKYXMgaXQncyBub3cgYmVlbiBtb3JlIHRoYW4gYSBtb250
aCBzaW5jZSB0aGV5IGxhbmRlZC4gRm9yIHRoZSBmdXR1cmUsCnBsZWFzZSBsZXQgdXMga25vdyBB
U0FQIGlmIHlvdSB0aGluayBwYXRjaGVzIHdlcmUgbWlzcm91dGVkLiBJIHRoaW5rCndlIGFyZSBz
dHVjayB3aXRoIHRoZSBuZWVkIHRvIGRvIGEgc3RhYmxlIGJhY2twb3J0IGZvciB0aGVzZSwgc29y
cnkuCgo+Cj4gUklTQy1WIGxpYmJwZi9wZXJmIG5lZWRzIHRoaXMgZml4IGluIDYuMTIgdG8gcHJv
cGVybHkgYnVpbGQuIFdvdWxkIGl0IGJlCj4gcG9zc2libGUgdG8gaGF2ZSBpdCBpbiB0aGUgYnBm
IHRyZWUsIGFuZCBoYXZlIGl0IGxhbmQgaW4gNi4xMi1yYzc/Cj4KPiBBbmRyZWFzIHRoYXQgaGFz
IGEgc2ltaWxhciBmaXggWzFdLgo+Cj4KPiBCasO2cm4KPgo+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi9tdm01eHE0NGJxaC5mc2ZAc3VzZS5kZS8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
