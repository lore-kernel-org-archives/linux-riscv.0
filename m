Return-Path: <SRS0=NAtM=25=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A670FC00523
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2020 08:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799FE20673
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2020 08:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErFD3PHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 799FE20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DgaOFHZLgjwNezzJXd7JqM2/8SEwUjSQ8f2FI/3fKR0=; b=ErFD3PHoG0aaJiJDT6igk+8xY
	fKafCa1Tx6QPcbB6ZwN9of5IjPGYGSEl0t1OmN2ydC9KVnYlJEbeidj2nEL/V+bCV7J51489UJRJO
	mpn8ISzymwat7quyL1VAnpCRKL9/6C/4IyzI2IpVSlI5Brh6/+ysMP2GQmIJzQ1G9i7Ok+tCd/Pdu
	4Yscz3dBW/ZttNWy+5Wf/HSnnJmdtCHop0s9PIj/7oubplJxKVrXhn4HPWbM1OZs+dTLmgMpVFV7Y
	r8KlJHKiZL5HeoxBXJ13ipOaPCOQ2Hqnr6psyGR8S70X2tPp3+ccFWjaUumtBoueVtDu94RhAAnyw
	8MSwIFzbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6tr-00052i-Cy; Wed, 08 Jan 2020 08:41:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6to-00051b-LR
 for linux-riscv@lists.infradead.org; Wed, 08 Jan 2020 08:41:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6907ACE3;
 Wed,  8 Jan 2020 08:40:59 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH v2] riscv: to make sure the cores in .Lsecondary_park
References: <20200108024035.17524-1-greentime.hu@sifive.com>
X-Yow: I will invent "TIDY BOWL"...
Date: Wed, 08 Jan 2020 09:40:58 +0100
In-Reply-To: <20200108024035.17524-1-greentime.hu@sifive.com> (Greentime Hu's
 message of "Wed, 8 Jan 2020 10:40:35 +0800")
Message-ID: <mvmk162z6g5.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_004108_849966_A18B6D38 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, palmer@dabbelt.com, green.hu@gmail.com,
 paul.walmsley@sifive.com, greentime@kernel.org,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The subject is missing a verb.

riscv: make sure the cores stay looping in .Lsecondary_park

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

