Return-Path: <SRS0=/vz5=ZE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66431C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2019 20:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3B921925
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2019 20:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yik9SzTP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FI3KbRHf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3B921925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSwoPmIV5NqIQEIYRN4OCpiBQ4GfdMXnJRpt5RTrfPc=; b=Yik9SzTP1uLesT
	CzfQZLfTjzNMQMrkU9uhjZxHvqS8wCFJqg2PQfVVys93HZPiGnWGNQYe9QpFoXw3bD1Zr7HLzU+1n
	BjfgPRQsB3wtHnRSrFOZ9cwo6I14mdoCiAhn8oodqlzgX6+DjpViWDjXGRAuhbd326x/FV8rOTkWa
	ZdMmWYYct/GgBVUHU1zTOoCEpB6Un2weWiuCBePQ7iVyCnozhH1rxvxqTZ2Q5V9WLzH9yru64YuMk
	F9F1FpSHM9FOb+TJ3IlEZqV8YqQRclsXgv3aFqkm5yBSrq+v2oOetwxFxskbyuWqTMyC0ChGtGGW+
	AH45C2Ot8zU1iDhxs7PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUcO8-0004N5-E9; Tue, 12 Nov 2019 20:03:44 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUcO6-0004Me-Co
 for linux-riscv@lists.infradead.org; Tue, 12 Nov 2019 20:03:43 +0000
Received: by mail-io1-xd42.google.com with SMTP id v17so19060377iol.12
 for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2019 12:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=s6f6V9n9AywCqtlEYD7ABikPaw5vUXYnibhyxVKqtTI=;
 b=FI3KbRHfRf+nC8+rlZL1sJKyQkdQpR3nunm5rzuIx7J/wP4BIidljiEeYtuV1WWy7d
 UuLVXa62DtNgMvtQCO72iPcYczgpnHqzMS+P3qwLaTGi7AakL7QVz824+Z5jGY/z708p
 2Ph16hPTcM5pUj0WHhwKIPGAm64TSfUMdM9MCqc+pzfYxG/vj8EcxElggHobyAGLj1m9
 3Ei9fjty5Ly9YbHY7G/BVq0q9592QFnPARPeWUMUlUgEnSvkey6+8Aw9OKtL8wLZx1n4
 A4tQifg6EFB2Hsi+1TvehPBqk7ytj65+tyhbUKtgXRCUBSHOU9zsmw+EVYfptHS3hRkv
 lyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=s6f6V9n9AywCqtlEYD7ABikPaw5vUXYnibhyxVKqtTI=;
 b=EhkX57A2gtXg7KYBwrWC5jnj2XP+ASU5eRUHILlPjg3hvrr1Bvvo7Nvrz5opTSOQzu
 QajwS2YPetf9/j74eLHpMfiS3k32f56Kpu9pcF3DCmmXc03BK6HkB4SoYd22aZgKqFh4
 yPZueBPjjaMFAkafwoWf+CpIyfFG2Y47LZUFvw8VcDo1Jp1VSrdS+w1MsIJYSUUjjj6X
 zAuJ19S/jaZb+hgZ7qcLN4mgWhqqOLQtijiWVOq2OxvrAYP9RKZrUymtqYnJRTcKyH84
 KiBrSo5Fgnnz8HLuToh0Ah8b6Yk8o32PCOVw35e5gWj0nmaio6B9maE3afiIQhJkeven
 DTJA==
X-Gm-Message-State: APjAAAX8AF3/eTd3et82An67omvOWOBG/RmgGmna61U3ANE3nDOKbHA4
 F7h+KeFdy1vbvwIArlyQxGUcJg==
X-Google-Smtp-Source: APXvYqzq4/vbp3I/o6aATlo+eszztTxJWdwpSjwumuT3pBQU0j8t5mCBgwjzR1iiTJmgS/ieiu5DcA==
X-Received: by 2002:a6b:b2cc:: with SMTP id b195mr986981iof.21.1573589021434; 
 Tue, 12 Nov 2019 12:03:41 -0800 (PST)
Received: from localhost ([75.104.69.238])
 by smtp.gmail.com with ESMTPSA id c6sm2713259ilr.24.2019.11.12.12.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 12:03:41 -0800 (PST)
Date: Tue, 12 Nov 2019 12:03:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v3] riscv: Use PMD_SIZE to repalce PTE_PARENT_SIZE
In-Reply-To: <1573203640-6173-1-git-send-email-zong.li@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1911121203150.32590@viisi.sifive.com>
References: <1573203640-6173-1-git-send-email-zong.li@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_120342_509059_650FBE61 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: hch@infradead.org, anup@brainfault.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 8 Nov 2019, Zong Li wrote:

> The PMD_SIZE is equal to PGDIR_SIZE when __PAGETABLE_PMD_FOLDED is
> defined.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks, dropped v2 and queued this v3 with Christoph's Ack.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
