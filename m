Return-Path: <SRS0=F0Tm=5L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE02CC43331
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2020 22:09:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FC220714
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2020 22:09:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdhXSYGW";
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akvZbJwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FC220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xQhYFF6y4wn4rE6PmQ6AibG83o09OQUtU1WK/Ma46ck=; b=SdhXSYGWWlOMmF
	wD+XxlT0V0vrta6+aAqJzzWQo2SbQagVWLWiNR2ik7J2UpndkBct5+MYCt+FWxiR0bva64pTmbQkk
	9Hkmmd6ntafRE+Com1Keoat6umgjhJLcxeeB/g4Xd5yla+73HgbwxrdPapgRZt+D5CT67YxP1ag1D
	I2Z+w0naN0YUcMYJoPjPZMGsTkhmNkp7HzkZAiMhE1dRXnP7hbQcBvxEZSIUC807NYgAJfWhgc11R
	H3v9DGFATTqhI4sLwM5YVurNWWYwhGdFIkxF1Rb5UTYRx+cxYC7V3ZoL2T1VKEyBP5YVBISi+RsKn
	XD7JGcGMwJEzP0u0PFbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHahG-0007Fe-Qz; Thu, 26 Mar 2020 22:09:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHahD-0007FD-Gu
 for linux-riscv@lists.infradead.org; Thu, 26 Mar 2020 22:09:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id ng8so3042967pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2020 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xQhYFF6y4wn4rE6PmQ6AibG83o09OQUtU1WK/Ma46ck=;
 b=akvZbJwQ4UqY8dEdD4OOU7Cs4BQb6tPZKbmzuuc6mIZBwhk4QrZXX9teTyhkZmJ9u7
 GQqwB87L1DCekEMbbdpxgo/hW4L/44Q78AGzmIXU6t0kVRDJpUDArNWaCmrahG03FiG0
 hF9Eipco8QpAb5xhXTkC8K4kH3eEfFXqSOryMdO4GlrcGc7oqSgRyVcb6gQA0wc6fDss
 33yCjgxpL8y4ahqNQvhgvmtGlLaEf5OzZK+9AY9yOrNPhaUKyUPjarRAL1fZmAaBjtzC
 kATcQQFKAaLHKLBwRJlTonNfUME8GmcvlAv3Yn/ha6cDXDXLNLRiJcxM4VDHe75OXlmu
 4bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xQhYFF6y4wn4rE6PmQ6AibG83o09OQUtU1WK/Ma46ck=;
 b=U/mNholQE5Zb/FNWT66Q+YfJVBbJ9H2EO8HQI5h3KHgF0mIR45YNocHCPH0kAhSfaa
 PSXUGMy9AxqzeUCLR5o2NAXzHsSPsmNxAUoeqbE3v3jWJMQWVodX4C8Bjy/HmocEC6BY
 +1z3LeQloz5r6EnZHbvJIb0ryYB39ojMQaZahsAywIWFHjgjKbDcyB21eZ0mCQtPE50c
 RtDzIpEWOr44XZx9ZVAx6ur3ucUkGJRxTePcWJB1v0jSm6QvfvFVP9f013v7QMYT6eVm
 wUq/dLUcDPexpVshEu24kl+bV3ULAvhBtpTlcWfbyXpui/vAqTHGDdoQJlOiOf1a3oDK
 1Eqg==
X-Gm-Message-State: ANhLgQ2KNcDYk+8+usp/lLcZSEwLV7yK7KpsHgkZu0DNYhFXyEoaO2Qv
 LaS4zmy+QpRr8+OXs/5UHZKyKipg8Pw=
X-Google-Smtp-Source: ADFU+vvtQ/vqEuU/+whp6Y7dC1Gc4getmlNoQblTGJoaqDBXvKot8eNWlbNEm5is1QNzWGDgc9slMA==
X-Received: by 2002:a17:902:b485:: with SMTP id y5mr9680315plr.4.1585260587328; 
 Thu, 26 Mar 2020 15:09:47 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id f15sm2501675pfq.100.2020.03.26.15.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 15:09:46 -0700 (PDT)
Date: Thu, 26 Mar 2020 15:09:46 -0700 (PDT)
X-Google-Original-Date: Thu, 26 Mar 2020 15:07:57 PDT (-0700)
Subject: Re: Kendryte K210 support v4
In-Reply-To: <CO2PR04MB23430FC5A3E1F47B4DF3A513E7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-9f7e9ebe-0ce7-4ccd-9a18-ed5d14c165e7@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_150951_566516_2DF4283E 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 23 Mar 2020 21:19:05 PDT (-0700), Damien Le Moal wrote:
> > Palmer,
> 
> Ping ?
> 
> It would be great to get this series in 5.7.

Well, the real issue here is that the new series don't appear to address the
fundamental issue I had with the patch set (kernel binaries that only run on
one system).  As a result it's gone on the list of things I need to go fix,
which is quite a bit longer than the review queue.

