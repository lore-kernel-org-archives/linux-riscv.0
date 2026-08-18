Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82318C5DF74
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 03:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQEi8yiE0PTXAhizrR6QxbUd3qY+9lmkxLJseIGqS6Q=; b=bEeg/yZVaEIDSV
	8KcIhjDlFIWFF86baoPQp3bLoUSh1QkvHbX9UBprkd8CPaFpJ4Q/YAKwCVkTj5KAwslhWNVIecD95
	zc6XNTljwKvbw3QmDvGPR7JpMQwuNGdL3oqkFu7/a7tGgel9MtQM8GUMqZ/I9MIj6K3Wit2f2B06G
	eXwzekRXtL8btKjq0y/4Sp79boj6aLkxyWpOEIpUQJlSd2w4GExwoinPdXilhhe+7BwcncXSg9mK9
	jpbfS3IcRrkGcD9+PGef/5ViIkTskWNlS6XQH8EVW6uas1vCNFY2gEwA/O+QRTtNCIS3LKlYdxeTS
	U+gMM645LttTLife8ApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAhz-00000007Czc-1Xzf;
	Tue, 18 Aug 2026 03:41:51 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAht-00000007Cyk-0T0h
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 03:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787024479;
	bh=M51RcODKtDrycnFlhGskAMNyMf/YOS5ysox2HrmCLG4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WVKGl7QPvSkOtgB9FnehwV273QauwKCUej0i5tKnE2d9v+/7fE5M3HupLPsFUwxfJ
	 gUQHf8UTF/HK/PibiDFgKNJVLRY+FVPz7Md14fhnrrMTOv/aGfscM+11O7vybPhrzV
	 6H/SyiyOu4CpYSgoYbj5XsZtV/78YKkHjiEncaf0=
X-QQ-mid: zesmtpsz7t1787024472t8d8f57af
X-QQ-Originating-IP: 8dt28FF39zpny7zVreDpqqEynBidAVsbYm5wAxeAed4=
Received: from SW-U22IC-015.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 11:41:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5519135494922037937
EX-QQ-RecipientCnt: 8
From: Peixin Xie <peixin.xie@linux.spacemit.com>
To: rafael@kernel.org
Cc: dlan@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	peixin.xie@linux.spacemit.com,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] ACPI: scan: Drop power resource references for deferred devices
Date: Tue, 18 Aug 2026 11:41:10 +0800
Message-Id: <20260818034110.1067658-1-peixin.xie@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJZ5v0g3pVxLgXBAHho5B+kfAiQQkQHGoO-1uBxp0OyXiGGcRQ@mail.gmail.com>
References: <CAJZ5v0g3pVxLgXBAHho5B+kfAiQQkQHGoO-1uBxp0OyXiGGcRQ@mail.gmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MDN2VRNR2P4wfc1YnJSBHR339Xf5anZIzNaUsa/6XTxSaFIIPN8ib/wK
	SNL+AWZbWRW3avH2mUPiYKwvd4h90L4rxI9nEV+Mbxh15U2hZmI1FHB22N+Kdwv4iI38GdE
	w7tt7WNKR4BdwRwAMpGWj8iDsF59427O4nZqjW/nd0z3s/vzL1z8RJOKPnIWDsUGmEH5khi
	A43lYm9m6xBTDkHb1WbbHIpvZ/eCLmB/whrJJ+MMB0lP4+LLQnCEFu6G8fGU3zs104PZFnF
	HXUEqMaIIGJQCEQvd4KCYMklZm5Fnv8scVnXsEBnhXAITfN/jFWm2JpLGWa3Vg5J/c+HhlN
	Fbqbel3kFjhYXqNYMFvQtHEHJk73TdUEibbIYOE7xCJ/4rNw1J51o10jxuCYBEwN4Zv/qYi
	GwJQfAK7qjUecj7QPgTU/U6LuvWhGcnO8qayhQDFAow3EfAGHTb3Kb99IAY+EumrKBLpS0N
	aPhTTi3geWyxZ8yJYoGtUXmHP5/xalpN6UZPqa/YQcIRCk/MC9jGO1Hj9G5gVs6ZeDuAF7d
	01dyo3P0yHRArOfcEdXWSvyPdmXxZYm/8zH5p696EpujQTftCyeT8xdLFZzGbWxyCYqPfM3
	hQxd5ebgdHXVcbKpeIFQswHwCqVIUU3Jg7z56PMpTNflhQL+mDjdb/crdthBrUS+Zz2VvNO
	Qo9NBeS8bRd1QDmtBH5JNrmv1pU18FjtzyXIwXxKvl3PkO1MDFurwVmpq0kQjHEvWB5nmHV
	vLGauk3gZ66t92peCznI8bbm5FodbOY87Uep6XyBxYT1gAm0xFYFIx3oXt7SJz8W59fEKAh
	v6A4eOD3CroVzy534KW0xMa4KD2k79Z4D2y3MNVjyHLmr+DQfo8EJPTDvgko2hr9G3xG14P
	rkmDwKbUQBVcAFEzInaqimcGl6RmMZ/+JymudJmqK99hoD+DOmkWAdkfkUZc/09zYfuKW0/
	hrfa5UXxuRT9KAsgbNHVgzA09sHqp+gd/I8E08A9F9OwXqpLAVq73Y8JFiHPOLiWyTz9Is6
	jN//0bf8XwspvRjo6YLljehXl4wc0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_204145_970616_F88B58CE 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2026 at 03:15:27PM +0200, Rafael J. Wysocki wrote:
> Have you considered dropping the acpi_bus_init_power() call from
> acpi_bus_get_power_flags() and doing it only once when the device gets
> ready for enumeration?

Thank you for the suggestion. I tested this approach on the SpacemiT K3
platform and it works as expected.

In addition to removing the acpi_bus_init_power() call, I set
device->flags.initialized to false at the end of acpi_bus_get_power_flags()
to mark the device power state as not yet initialized. This causes the
existing path in acpi_bus_attach() to call acpi_bus_init_power() once the
device is ready for enumeration.

The power resource references are now balanced and runtime suspend and
resume continue to work correctly. I will send a v2 in next couple days.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
