Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F9C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W11tYVqoj2W7xu+lEclSjIn+3lKcgsGhMlOFhATfrK8=; b=JuWnLbWn5H4UVS
	jVqzxLa+wQ29ci9WexHOyMcVcXjrlOWwq0Ma+OPA8yFJ8no5B18P+VnmpIO3kmbFIPz8iGxeG6+s8
	eOdQjIfBA/jgjVjUgJHzsyblpWTV4XYo+Pm6aB2uBWJNjcxRRwde8qFp+qeRc6uhaX8S+SL5cElBg
	UAqckBw4zEAtETA5idn6gdITZg57HiQhtE7z7acFRmQHMA2j5zNs6Bc2luqepCK3iwbRL2DSrBnDZ
	lNC3OmxaVok6fQNbnlDVlF8VMVGBSNSZREUShIBbZBelBRS1vh2qYqhahbQO314Nk4Kv9p/AzHXJ/
	nZ3Ah54qpoxUlRUY4uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lkl-002wV4-MS; Fri, 24 Jun 2022 16:01:51 +0000
Received: from forward501p.mail.yandex.net ([77.88.28.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lkb-002wQy-AF
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 16:01:43 +0000
Received: from myt5-d8fb82618a34.qloud-c.yandex.net (myt5-d8fb82618a34.qloud-c.yandex.net [IPv6:2a02:6b8:c12:59a3:0:640:d8fb:8261])
	by forward501p.mail.yandex.net (Yandex) with ESMTP id B2D0B6215D67;
	Fri, 24 Jun 2022 19:01:36 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
	by myt5-d8fb82618a34.qloud-c.yandex.net (mxback/Yandex) with ESMTP id cyUyyZV0wd-1afeYLWn;
	Fri, 24 Jun 2022 19:01:36 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656086496;
	bh=abAFNI17TtevmvwX9RIhVhlH0z4SjFXAqbUQQLt25Yw=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=iLGXD1rC/AY6NKP7zBvtime9CVxW1/ZTQblFSr7nQbojY7tklxefLb/vqLudWfxHP
	 FH93mkv2rQIX2iPBgUWD6YzBoUmZ1EdCadbYEHx8hltDilu+KmZJGJVEHp5qhxL4ki
	 BUoiCtHlvwF+KHY3tBi3Aqd1lIMrFO7BEIW2O5S8=
Authentication-Results: myt5-d8fb82618a34.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id iVUkuL8Azf-1ZMKvOse;
	Fri, 24 Jun 2022 19:01:35 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/5] perf arch events: riscv arch std event files
Date: Fri, 24 Jun 2022 19:00:53 +0300
Message-Id: <20220624160117.3206-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624160117.3206-1-nikita.shubin@maquefel.me>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090141_625720_848FF458 
X-CRM114-Status: GOOD (  11.48  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKY3ljbGVzLCB0aW1lIGFu
ZCBpbnN0cmV0IGNvdW50ZXJzIGFyZSBkZWZpbmVkIGJ5IFJJU0MtViBwcml2aWxlZ2VkCnNwZWMg
YW5kIHRoZXkgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBhbnkgUklTQy1WIGltcGxlbWVudGF0aW9u
LCBlcG9zZSB0aGVtCnRvIGFyY2ggc3RkIGV2ZW50IGZpbGVzLCBzbyB0aGV5IGNhbiBiZSByZXVz
ZWQgYnkgcGFydGljdWxhciBQTVUKYmluZGluZ3MuCgpEZXJpdmVkLWZyb20tY29kZS1ieTogSm/D
o28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4KU2lnbmVk
LW9mZi1ieTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgotLS0KIC4uLi9wbXUt
ZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uICB8IDIwICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJp
Yy5qc29uIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5q
c29uCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYTdmZmJlODdhMGY3
Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvcmlz
Y3YtZ2VuZXJpYy5qc29uCkBAIC0wLDAgKzEsMjAgQEAKK1sKKyAgeworICAgICJQdWJsaWNEZXNj
cmlwdGlvbiI6ICJDUFUgQ3ljbGVzIiwKKyAgICAiRXZlbnRDb2RlIjogIjB4MDAiLAorICAgICJF
dmVudE5hbWUiOiAicmlzY3ZfY3ljbGVzIiwKKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUg
Y3ljbGVzIFJJU0MtViBnZW5lcmljIGNvdW50ZXIiCisgIH0sCisgIHsKKyAgICAiUHVibGljRGVz
Y3JpcHRpb24iOiAiQ1BVIFRpbWUiLAorICAgICJFdmVudENvZGUiOiAiMHgwMSIsCisgICAgIkV2
ZW50TmFtZSI6ICJyaXNjdl90aW1lIiwKKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgdGlt
ZSBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgorICB9LAorICB7CisgICAgIlB1YmxpY0Rlc2NyaXB0
aW9uIjogIkNQVSBJbnN0cnVjdGlvbnMiLAorICAgICJFdmVudENvZGUiOiAiMHgwMiIsCisgICAg
IkV2ZW50TmFtZSI6ICJyaXNjdl9pbnN0cmV0IiwKKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJD
UFUgcmV0aXJlZCBpbnN0cnVjdGlvbnMgUklTQy1WIGdlbmVyaWMgY291bnRlciIKKyAgfQorXQot
LSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
