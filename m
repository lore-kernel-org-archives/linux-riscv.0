Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F7DC48BE0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 14:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02333613C8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 14:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02333613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6CZeVAmcVkw5gjQptCu0lc4ikhChcu4lPEcee+cQSE=; b=pdunbZ5DyDCPz3
	jinCaYVx7GvFMdfFQ2E2sk0mTpwP6QY7nsXzLlCySXCnYz9xKGNG+GFmND00vP2+MWBdCSG+XVV8r
	sgUB4RcDauHxDqQqp2eYVDlrkZlxC9YW9k9bBJejNwl5ygylavGdzV8ddqv7VzXwkEyfSanyGKQCe
	iwVPxUrnyzPP/zs1UBJLRVjY0rgv1q+ewWm1SI9od7Rq4l8ke95tUzShDRAZP8anmiiZPwH4BrEGd
	8KPEjQiZZ5WFz/iBkUioTl1N05/1ZM5DqGKh45JxKvhpE40jrVsCB96+u84Qvssxuc8FEL9epyvbR
	J+Ync/s9jHIUNgx5/aSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrhrU-005Zxb-Oa; Fri, 11 Jun 2021 14:10:16 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhrR-005Zvp-Qx
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 14:10:15 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G1jR31TRzz1qt3l;
 Fri, 11 Jun 2021 16:10:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G1jR26D3Sz1r0ws;
 Fri, 11 Jun 2021 16:10:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id blSMxjRTcGUs; Fri, 11 Jun 2021 16:10:04 +0200 (CEST)
X-Auth-Info: dkbXKa2FuB4b08eUrov5kSul9UpeLtIdhCkDN2zB3p004oJgCtYlXEmO7oD1pnrg
Received: from igel.home (ppp-46-244-189-84.dynamic.mnet-online.de
 [46.244.189.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 11 Jun 2021 16:10:04 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 01ABD2C365F; Fri, 11 Jun 2021 16:10:03 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Andrey Ryabinin
 <ryabinin.a.a@gmail.com>,  Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,  Dmitry Vyukov
 <dvyukov@google.com>,  =?utf-8?B?IEJqw7ZybiBUw7ZwZWw=?= <bjorn@kernel.org>,
 Alexei
 Starovoitov <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,  Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>,  Yonghong Song <yhs@fb.com>,  John
 Fastabend <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>,  Xi Wang <xi.wang@gmail.com>,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,  netdev@vger.kernel.org,  bpf@vger.kernel.org
Subject: Re: [PATCH 7/9] riscv: bpf: Avoid breaking W^X
References: <20210330022144.150edc6e@xhacker> <20210330022521.2a904a8c@xhacker>
X-Yow: Look!!  Karl Malden!
Date: Fri, 11 Jun 2021 16:10:03 +0200
In-Reply-To: <20210330022521.2a904a8c@xhacker> (Jisheng Zhang's message of
 "Tue, 30 Mar 2021 02:25:21 +0800")
Message-ID: <87o8ccqypw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_071014_052574_1BBB1775 
X-CRM114-Status: UNSURE (   8.59  )
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

T24gTcOkciAzMCAyMDIxLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgoKPiBGcm9tOiBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4KPiBXZSBhbGxvY2F0ZSBOb24tZXhlY3V0YWJsZSBw
YWdlcywgdGhlbiBjYWxsIGJwZl9qaXRfYmluYXJ5X2xvY2tfcm8oKQo+IHRvIGVuYWJsZSBleGVj
dXRhYmxlIHBlcm1pc3Npb24gYWZ0ZXIgbWFwcGluZyB0aGVtIHJlYWQtb25seS4gVGhpcyBpcwo+
IHRvIHByZXBhcmUgZm9yIFNUUklDVF9NT0RVTEVfUldYIGluIGZvbGxvd2luZyBwYXRjaC4KClRo
YXQgYnJlYWtzIGJvb3Rpbmcgd2l0aAo8aHR0cHM6Ly9naXRodWIuY29tL29wZW5TVVNFL2tlcm5l
bC1zb3VyY2UvYmxvYi9tYXN0ZXIvY29uZmlnL3Jpc2N2NjQvZGVmYXVsdD4uCgpBbmRyZWFzLgoK
LS0gCkFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKR1BHIEtleSBmaW5nZXJw
cmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3ODAgQTlEQSBBRUMx
CiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
