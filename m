Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83A9C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 00:05:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9112420866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 00:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HP5gAoY8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L/FcNMEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9112420866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xULsK5WFMu2XqL3Mlqa6HeEQY9QUogIkIY6arsGT+Vw=; b=HP5gAoY8BIO+0ea+CE5A7M3HN
	ydljls7xBTFkK5NnYWr2JUhX9FD85RQX6a+DS0b6GOR2dh0xsPLo/7opzrv9ZjKnTGausA9ZZtBYA
	hRmRjwZbHpYNGDpcqkS684/1G2AbT1GyArSpcfCZHW2nOYmJTuqhrcBKj6HaD/K4Cb+ElLXzw5tin
	ra/IKXVcLasgx9xsNvsP8vrZtFTt7oo+kyeCoFAO9autX0vJyvIHoGhCQl/xlPf4sgDGhvDcX/1yP
	mhGYTvRJ+9RtBUynrC2yA27ylenOEapNH20aqAYwc2d9//4mQ4IKMLziRGnBgVuo4ywmRWpeXos0W
	BGnD0ezvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCCr7-00053g-KB; Tue, 16 Oct 2018 00:05:01 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCCqc-0004oL-2F
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 00:04:32 +0000
Received: by mail-pg1-x542.google.com with SMTP id a5-v6so9906302pgv.13
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 17:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tMQBZuAMjt1FkZfBs4UV5DijDt4DkhvMojJJ2OXPgtI=;
 b=L/FcNMEOU5xYzlq2zP+54tuWOifb9dchGTzVIE+3WhCzbjLPjnIVjA6MuFM2TfE5xw
 nqDC1sVDDXhjo9DcovreSnlmDSxYfzUPWUTCstOdyg6XNRvkceGAdhbM7sK9NigeifYc
 /P+BOykiYH6stLHqyuSAEPH+VI/7q+QsBpgi3EdrPh6KvvY8gGIQP+NeAKPhGlI/7h9O
 k9CcA0LfNtg8HExsoaKiYB4yjdBwMhUKDRZF17G1/aHcmK3Tm5vqq6TaAybn5hSiPns4
 EIqORFPCBb7eLL1PvppT44M/g+9ge/Y1deLRAz36kzywY9LKDQ4i14MTYF/cvA1RHTJJ
 F8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tMQBZuAMjt1FkZfBs4UV5DijDt4DkhvMojJJ2OXPgtI=;
 b=TtDheV6LpYXD993cip0k6A6w5bm3EWwzIV3d5jyACGozAPEX/g5Li8D6DHG3Z//Z4a
 ri83OGE7CfLybax3NBjpxBsrvKYY/SXzLMQl54tB79A2XeSkmsRgCZuk7uCVx8DzJmbR
 p5zcc9Q/fkukoq4NXYYpVX112cM1FWywMjIg6qIe/z0EvrhGRSk9kmGVIM2D1/Ee9ZdR
 6z+ZgudI2w0tjfySl6vtCRoNItunfipZRtH5cxplvTuEdaBawRjmxFtjmgRj4mQl80uR
 ryKUVrb8u7An6XZLXcnLdkSsA4o97ORLMahBBjvNYJV+VJtHgk62kW0JufjApGTDPFnf
 9Z/g==
X-Gm-Message-State: ABuFfogp1FbCJXppdqxiFquNkMvr96x3r23n8j9Fa08r+Sqz7WXL/AsX
 AqeM756H+1Z2DoO8Pi6vgqmZxw==
X-Google-Smtp-Source: ACcGV62A+CYJf4BHUbwI8z72gjvJ4gRfUglCggCNOBalkZvnLineMaxhPGxx/qem+YitjDzY01OkUw==
X-Received: by 2002:a62:2c16:: with SMTP id
 s22-v6mr19621680pfs.6.1539648256407; 
 Mon, 15 Oct 2018 17:04:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i69-v6sm11524907pfe.106.2018.10.15.17.04.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Oct 2018 17:04:15 -0700 (PDT)
Date: Mon, 15 Oct 2018 17:04:15 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Oct 2018 17:04:10 PDT (-0700)
Subject: Re: [PATCH v2 0/6] sparsemem support for RISC-V
In-Reply-To: <20181015175702.9036-1-logang@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-fd0541de-3ac1-4772-916d-be6b2d02e63e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_170430_120973_DDC060CA 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, sbates@raithlin.com, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, logang@deltatee.com,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016000415.JS6znrCkFuJnRiEIEJb5lQeYbz6zRa5rDqctYfbfRlY@z>

On Mon, 15 Oct 2018 10:56:56 PDT (-0700), logang@deltatee.com wrote:
> This patchset implements sparsemem on RISC-V. The first few patches
> move some code in existing architectures into common helpers
> so they can be used by the new RISC-V implementation. The final
> patch actually adds sparsmem support to RISC-V.
>
> This is the first small step in supporting P2P on RISC-V.

Thanks.  I see less maintainer tags for the parts that touch other ports than I 
would feel comfortable merging.  I'm going to let this sit in my inbox for 
a bit and we'll see if anything collects.

For patch sets I submit that clean up other ports I've attempted to split the 
patch into N patch sets, where:

* One part adds the generic support, which starts out as dead code.
* One part per arch uses the generic support.

This is a bit of a headache, but it at least allows us to get the RISC-V 
version that uses the generic support in quickly while waiting on acks from the 
other arch maintainers.

Like I said, I'll wait a bit and hope people ack.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
