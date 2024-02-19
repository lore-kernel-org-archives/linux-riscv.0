Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52EC48BF8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBe5xG25jhTbIryLvcYluLh6FU4EkdbYg6NCPuQd3L4=; b=h8g3rblBRL079I
	4rmLztZA7HAiKP3oT8xKbVbdznpJUt5zvmc1rwoYOXxnXUsRz9wi0XVrIoysxt6XiZ8zmDLP58rb7
	K/lSpHn7vubw1lzxqntB4te/tfmwVOvdiReY9ZY/7Uf+XlqZYSavb09RsoHbD+k6oCyNc4JeZ833K
	FH13eKZ49uSxhRn+3lKPcbUHAgWDdToTSRhKsTVcpdUD1LgHyDxGteng4TSN7VzECXPOPElJZgrNO
	+aAZaz1tPrkXUW2tdHrsIj37JfqVYUL/BPYMGqeM/8spxbvROrKpO/LbQL7UW9w0a8Gm7d5Az6w5L
	ee96RrqBsfRFB7tvFBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2kd-0000000AOO9-1mqp;
	Mon, 19 Feb 2024 12:28:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc2ka-0000000AONA-2aHO
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 12:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09E29CE111D;
	Mon, 19 Feb 2024 12:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FABC433F1;
	Mon, 19 Feb 2024 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708345678;
	bh=v7TF6D7rCT1Xtj8T7jMIW7GSQIy+0TcQjmq6sFHYN4A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WPbwxWgkOxrUtLw7Mw3h4YpF7/LTym0hpLxdG8wqk5340/44ljPpxuKq0yNAsw5Xe
	 XXsGPTZMtJkv4JrFyVobC2xIQ7OZ2cpZmUZ0EcFyxdnd6akVpIiQW6xzAQZBC3ma7X
	 BKRsKMRxhBrj377tMduSIDpnoWBG7ZEsOaUSrjMS53T4xDSYs6ibw3y+pkWH+0h1O5
	 DRCEv9LkL4oHeO6kEae1aUKnVjUzAUJQOZ2V/f8YVBfb/h49VLNemwqnyOQSLjhXyD
	 5iVBKLcjNG+PjfcTajEpMw9hJIDLGX+ol4v14foE369aH40ZcZ2KszOsKVddQsUf9D
	 +YLculyxLh6EQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 2/7] riscv: jump_label: Simplify assembly syntax
In-Reply-To: <20240212025529.1971876-3-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-3-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 13:27:55 +0100
Message-ID: <87edd8fxkk.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_042800_842149_BC80A13F 
X-CRM114-Status: UNSURE (   3.43  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gVGhl
IGlkaW9tYXRpYyB3YXkgdG8gd3JpdGUgImphbCB6ZXJvIiBpcyAiaiIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KClJldmlld2Vk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
