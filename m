Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF879C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 05:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZ7r7MX4U3F1vFTP6ipTH7rTTL0VEf681G496CNfZUA=; b=Pqw7Q9V1P5NLTt
	RnjttU76ZmGRPEE5j9Ey/M9KnWsqu9JMaBm2h4R8YcDa+/vK7CugHbt+g8amLdZMSbs4hsDT0xbJ8
	18hy+wP7+MMefQDo84afgbPaXCwh2R3xl+OPMOWBaAUTprVWhylhfABSXcNyX6wR98vjeZ1tRFQpw
	ZzMkXDU6sMEtWQte4bR0w4daDYgDlmnA1rSaA7vpzZFQYKDzawXgKRAOZSNpBgwUP/cjxtKQuxWjn
	upiZ8vM9bHe0ZYza5N61pPjvRfEQ/5S4u1xY9ntOHxb6dxc2pQwjUJIKsAZQvEktVMBU2iSLGTPDz
	W1UA+AADh+YfNydqZiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8DBO-0076Ph-0S;
	Wed, 29 Nov 2023 05:32:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8DBM-0076Om-0T
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 05:32:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cf8e569c35so42345025ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 21:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701235936; x=1701840736; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj4mmJIBUQjwsLyHUMay3Il1zQC/QaufE2Lzb1TCd5k=;
        b=aq49m+7fuIvqUTuuBkmIeMPQPdfB1kyF3IpQSQVWLwvSAgZ911e0YZeOw4I6qSPIsZ
         MtcKLwv2vyLVE4D/JaBQ+U9kbV1LNTbN+GmnJHTrYxzaj534cs8r8X41easWPi4tOMR4
         VAGbKyPhtaK3gcgS3KQ9t8ppeR7JJmYqgmIRYvf9lSvgGGa/7BoqsIjbaoyHh+jj+vOK
         tw7ps4zm4XmarWLmYE7P6319O6l+Dj6khJtU4dwIqrVzVFpDsdy92lxXYaJoNzgjJ4Nx
         gZ943bkYtuvZJXkF2gaeYSYRwaJvKYB8tFgG88ZIjkod4+W8iW6pLV0oXHV3NkNVLKWQ
         INRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701235936; x=1701840736;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj4mmJIBUQjwsLyHUMay3Il1zQC/QaufE2Lzb1TCd5k=;
        b=SYqZh7JInR7i7wvn8HJqkJ3ZB7pQ4t1gw527l/H5AM0SfBid6pg+1paMUJirzLTyGs
         yV8WvsxMi7kSOFC6l8KB8UM+eTp6fkjObePNBq+qcTMCHE0Z2nEjInJgwJ+J8tMgObup
         LN1CsjdF2WUumVKFPQEdzUwmrXbn6hdlQFdG2Yp/IdCSk+Y2x/XQj1HT9ly6WDNc6UeU
         JqdbhjeGlrVwA52uaILG8unQlz6iKyeBBN9WEJFRNWAoqllMobodpTTcFDnlJelrIem9
         II8wK+PElv9cnRBGwjFbh5v+Diy08aRVcJpKKjk03qqMDnNX0V+Gqpy8EOZnGuASOCGA
         e3Ow==
X-Gm-Message-State: AOJu0YwI1uUn8MPpw7u/SIzknhelY/BcmO8Uc2dVft0SJ+IV8R8RoML0
	yR1q1dvGAB0ClFmLxT2/nF2Dhg==
X-Google-Smtp-Source: AGHT+IGFsjXCW/Ho6O60mLG49EAl+1QT8CzD7tPecYI3HFKFAodNBvFnLj0US/gDsjpY2a1LcMzpWA==
X-Received: by 2002:a17:902:7005:b0:1cf:d795:5e4a with SMTP id y5-20020a170902700500b001cfd7955e4amr6885924plk.15.1701235936505;
        Tue, 28 Nov 2023 21:32:16 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a34:50a0:78b5:5013:4cf4? ([2402:7500:4ce:5a34:50a0:78b5:5013:4cf4])
        by smtp.gmail.com with ESMTPSA id ix6-20020a170902f80600b001d00c25c282sm1236711plb.18.2023.11.28.21.32.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Nov 2023 21:32:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 12/13] RISC-V: crypto: add Zvksh accelerated SM3
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128041314.GK1463@sol.localdomain>
Date: Wed, 29 Nov 2023 13:32:11 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <2E9C9E5D-D03B-4038-AA6F-D30540390816@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-13-jerry.shih@sifive.com>
 <20231128041314.GK1463@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_213220_237326_AF3AFE32 
X-CRM114-Status: UNSURE (   7.87  )
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

On Nov 28, 2023, at 12:13, Eric Biggers <ebiggers@kernel.org> wrote:
> On Mon, Nov 27, 2023 at 03:07:02PM +0800, Jerry Shih wrote:
>> +static int __init riscv64_riscv64_sm3_mod_init(void)
> 
> There's an extra "_riscv64" in this function name.
> 
> - Eric

Fixed.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
