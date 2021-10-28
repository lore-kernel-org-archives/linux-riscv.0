Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D291C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83B76058D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C83B76058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfHPRQxBwjOqW7OJYzuaJvA9nURJJH3m7+ybmSDi1Uk=; b=hxzM9uPog24O16
	0VeqFylNG0Qpf+hB+SUh+/zu49bgnBuyk4J3qwS9cBfNg8brcSCc0sOiD17X+knN79m2CK9nUCjjV
	XsTGb8xb8gjR4h1j3kJ+ZjsFwTPAT8r9RBy/adWqjSbVQkVapmPDR3zyPai7JlEXvFWr9zRVU0l3u
	nKIjFx9QWrTKNWNeaW7eZrv2RCdh6ZPVdMN2Fta13a0Mu7E3wGwMvCw7HWygxNK+aO4HZmncvXdih
	UbQrfsRaXw5HwEGzgoJcN0/U5UDKwNXf21LxmYNoWykP+NoOG9eSp0OnTHOiM6GtAJ+CYd8XEKk63
	U6I9JJFhLH+caXy9l4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7zg-008WlS-Ly; Thu, 28 Oct 2021 16:11:08 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7zd-008Win-QN
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:11:07 +0000
Received: by mail-lf1-f43.google.com with SMTP id u11so14711481lfs.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvbhACnEYV1022Gk5eA/3v6HqT63c7KWu84vs0/IVbY=;
 b=5B3av27vokGEQKe0lEsBkyhWvbzxO/ixDGJTV61a1+fcHej8G3hGoo/CBEqP90bIdu
 U53KB0uK/63/RDEKnCM5qOlSYvk3S0WkZccan2jl/Fb99pYhfgydpGKB9Ucw1BjuwJfN
 7DdNdwd44E0KNODKmR0Ej8/5Qy3q6+uqcnJTS612yec073Idn+i0bKB9ca5IEB34XEXN
 Gzq2FHlrn4uczuzkTtu/k6grDiIjOgDqtVFOCDZxjZMvdd2EbEKjd8WPe9O82yymWo1M
 vyu0L9v6MdekdLmgIl7fkTIzeE/TdhOdWGtgWoqmhAf4Nu+fTUI2W/ECxWUHCq/DhSzh
 j6HA==
X-Gm-Message-State: AOAM532OYTMnwmLFpJMb+323DIUB590B5cQDkt8kwAO28EYWSBxpmjMW
 +0Gcfu+P0l4aDZhEbYUadfdPfIc5GsQ=
X-Google-Smtp-Source: ABdhPJxzQ6+RW6xoki+y/0taUmPzC2/z2+vGdooU8FzF9JjLc2mfl3w6n/6unuLu8TcuuwjRX6K05w==
X-Received: by 2002:ac2:4e15:: with SMTP id e21mr5274403lfr.655.1635437464097; 
 Thu, 28 Oct 2021 09:11:04 -0700 (PDT)
Received: from kladdkakan.. ([193.138.218.162])
 by smtp.gmail.com with ESMTPSA id o17sm49680lfo.176.2021.10.28.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:03 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v2 0/4] Various RISC-V BPF improvements
Date: Thu, 28 Oct 2021 18:10:53 +0200
Message-Id: <20211028161057.520552-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091105_879834_0CBF7CCE 
X-CRM114-Status: UNSURE (   8.17  )
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

VW5mb3J0dW5hdGVseSBzZWxmdGVzdC9icGYgZG9lcyBub3QgYnVpbGQgZm9yIFJWNjQuIFRoaXMg
c2VyaWVzIGZpeGVzCnRoYXQuCgoqIEpJVCByZXF1aXJlcyBtb3JlIGl0ZXJhdGlvbnMgdG8gY29u
dmVyZ2UKKiBTb21lIE1ha2VmaWxlIGlzc3VlcwoqIGJwZl90cmFjaW5nLmggd2FzIG1pc3Npbmcg
UklTQy1WIG1hY3JvcyBmb3IgUFRfUkVHUwoKTW9yZSBkZXRhaWxzIGFyZSBpbiBlYWNoIGNvbW1p
dC4KClRoZXJlIGFyZSBzdGlsbCBtYW55IGZhaWxpbmcgdGVzdHMsIGJ1dCB0aGlzIGlzIGEgc3Rh
cnQuCgoKQ2hlZXJzLApCasO2cm4KCnYxLT52MjogQSBuZXdsaW5lIHNuZWFrZWQgaW50byB0aGUg
TWFrZWZpbGUgZm9yIHBhdGNoIDQsIHdoaWNoIGJyb2tlIHRoZSBidWlsZC4gUmVtb3ZlZC4KCkJq
w7ZybiBUw7ZwZWwgKDQpOgogIHJpc2N2LCBicGY6IEluY3JlYXNlIHRoZSBtYXhpbXVtIG51bWJl
ciBvZiBpdGVyYXRpb25zCiAgdG9vbHMgYnVpbGQ6IEFkZCBSSVNDLVYgdG8gSE9TVEFSQ0ggcGFy
c2luZwogIHJpc2N2LCBsaWJicGY6IEFkZCBSSVNDLVYgKFJWNjQpIHN1cHBvcnQgdG8gYnBmX3Ry
YWNpbmcuaAogIHNlbGZ0ZXN0cy9icGY6IEZpeCBicm9rZW4gcmlzY3YgYnVpbGQKCiBhcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvcmUuYyAgICAgICAgfCAgMiArLQogdG9vbHMvbGliL2JwZi9icGZf
dHJhY2luZy5oICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9v
bHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoICAgICAgICAgIHwgIDMgKystCiB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiBiMDY2YWJiYTNlZjE2YTRh
MDg1ZDIzN2U5NWRhMGRlM2YwYjg3NzEzCi0tIAoyLjMyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
