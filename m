Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B93CC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 02:49:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70F82081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 02:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+peIAIl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KvwYOzHP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70F82081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nWxXfLSPfuWEl9nvBlMnw8KQZg9bH42eqAwV2iyor7k=; b=K+peIAIlQd3qq9I838gWbelYC
	BKPV49M+ou/Mlhy366JdPPv7CoaJ5B501yVullH3Z184sCS3xG1aikns+5lIMs49ztoUwVeacL+8t
	6P29P37NOUzuV4TM7izm/bxP3BAXnFoxIKuswKZUkoRmiCvcGRrfFSLqUoUiU1Aq8ErqwSk1sX0P3
	2rAFga4SR3oPvp/jnrBDqg7EcN9w6zQEwaKD+WEMdn9CJGPNfNfz9qOWMmHR6ke7gUNqDiXuDekwv
	MmHdlD5wQwR9vLILR8FqSQZh+VTOSZE3gPG9dpiAnjtrZysjb5QOILrNJMynDKBQDD4KZpaIE3iue
	ccXGfwNGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIPWv-0001fM-KA; Fri, 02 Nov 2018 02:49:49 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIPWs-0001eG-Fd
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 02:49:47 +0000
Received: by mail-qk1-x743.google.com with SMTP id f18-v6so907708qkm.7
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 19:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gLdRHMjbgeWlw9o6eNW+MJmbK+t3p3rf5lxNRWBF4oo=;
 b=KvwYOzHPYV3KhSmx3eg9tW+xhsjiEL9t3wNg7kzZ83T4jujE/pcwozRJ+BzqTvzmKz
 JzT3/Y3PS+x6oXKWcvi/M5WsrToxsspZtPiEeCPuoA6huhOcHyQo8Y2Zl6Vdq8WCxFj3
 QMOVD0neYtpUkveVIoz19a1lb3uabVqGgOotbQph3lm1pMIw1PBVT9ocJsOHoZmCuqVa
 hkDXmTL5SHZ/d4CaGH/692Rb6CLHLKKIglHK9V44Eac1uhNwoAlvhN9EST/kPX2YM02C
 fnEhftgU5O1LIBYfAsJCQoOVjtJayXRV6pocvxdFogq4H3Z8A9k9BfjCJub/xy9FqgV0
 cxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gLdRHMjbgeWlw9o6eNW+MJmbK+t3p3rf5lxNRWBF4oo=;
 b=sYHT2ny2vn0VEaxoQsEUgbyO5crpCmS35BKV58ZzuzMnF40AzAAUlOuswFPuYicwkw
 ZkgMCF2Jl9xqXBt4sTEq6EKp5+w6y7hm4IByuq/uo2uaBg8y+38SjBysqjK8xKK8PqyJ
 9lBnZuvbYav8noaJtby8zyGzY2IdHSGcMRx4baiYpmYlDdbZPX0qwVXn69Iq/GLmptBA
 bUv09kN8o3Q2SOw4Fa+KpW7zInT4TWYZ/bJm3jHuH9/LvTRoyNTXe7l0NbgbnvWWph5X
 Uc1EUqmCBqc5tqR6+HhBCfcv75dP9jcIgOt2Vg3kh9xKAJ6jTUFuETb6mztKHiVl4PGw
 SApg==
X-Gm-Message-State: AGRZ1gLp8p9ft2gqYbESyPAdk5dT0ACJTBGNMIVsXEE3RYWKp2OVEhS9
 xEdjiSparmk4xOWuamnSz8Nf+Q==
X-Google-Smtp-Source: AJdET5e8vaAcI5oFmpNsdiU1ib5TzyN0jVwNHEBJLtnj7r+Y/Trl5i+K3YjELB7gen5Epb2pCXf3+w==
X-Received: by 2002:a0c:98d1:: with SMTP id
 g17-v6mr9270791qvd.13.1541126974328; 
 Thu, 01 Nov 2018 19:49:34 -0700 (PDT)
Received: from localhost ([199.255.44.5])
 by smtp.gmail.com with ESMTPSA id f75sm9315464qkf.96.2018.11.01.19.49.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 19:49:33 -0700 (PDT)
Date: Thu, 01 Nov 2018 19:49:33 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 19:35:51 PDT (-0700)
Subject: Re: SBI extension proposal
In-Reply-To: <20181101164205.l2bra3a6kihjpuib@excalibur.cnev.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: merker@debian.org
Message-ID: <mhng-dd74f93c-74b1-4701-a73c-339d81aa0bd0@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_194946_551686_7EB899A7 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: mark.rutland@arm.com, zong@andestech.com, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, Andrew Waterman <andrew@sifive.com>,
 alankao@andestech.com, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, rjones@redhat.com,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 Michael Clark <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>, philipp@hug.cx,
 linux-riscv@lists.infradead.org, abner.chang@hpe.com, vincentc@andestech.com,
 David Abdurachmanov <David.Abdurachmanov@cern.ch>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102024933.jSZOKv4Cfsut-hhqJkT4H6nVkfgGiM1ld8NMoqkahoc@z>

On Thu, 01 Nov 2018 09:42:05 PDT (-0700), merker@debian.org wrote:
> On Thu, Nov 01, 2018 at 09:46:09AM +0000, Richard W.M. Jones wrote:
>> On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> [...]
>> > > How about putting the version information into device tree
>> > > and use the compatible string?  This seems more reliable
>> > > than probing.
>> > > e.g.
>> > > firmware {
>> > >         sbi {
>> > >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
>> > >         };
>> > > };
>> >
>> > If it was just DT then I think having this information in DT makes
>> > sense. In future,
>> > we might definitely see some ACPI support in RISC-V too (just like ARM64 world).
>>
>> I agree.  Please try not to make things that depend on DT, as it's a
>> Linux-only description which isn't suitable for other OSes and has a
>> poorly defined ABI.
>
> the notion that DT is a "Linux-only" description and not suitable
> for other operating systems isn't correct.  Besides being used by
> Linux, device-tree is also used by at least U-Boot, FreeBSD and
> NetBSD.  Based on issues in the early days of DT one can surely
> discuss about device-tree ABI stability, but since then a lot of
> effort has been put into making DT ABI-stable, and in my
> experience this effort has been successful.  On the other hand I
> have experienced way more ACPI issues on x86-64 hardware than I
> would like to remember, so I tend to assume that in the ACPI
> world also not everything is nice and shining.

I'm treating device tree as a stable interface, at least once it's written down 
as a spec (like all our other interfaces).  At SiFive we're treating it as the 
standard interface for static device discovery, so interface breaks will be a 
huge pain.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
