Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D52CDB475
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 02:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyiNNAGDx+ryeG7hPZqY1PAVwpT3WMsDZr0K4Yw2ukI=; b=S3Yx3oMJzTWeD5
	1PJ3yBpk4WSCYd3L7EPSG63lVbZGZB89445F1ZlZplaGgP1A6hW+flJSVdOXEsgvi6JOaX6pKpHZi
	y5Sqlmy6exyeLIrPN/3c8BmSW9Dq4WLiNwlHGUQfMDpX6YBXdw7jRv2nrtmSNKksZv3lO2cVTGx3U
	N47AUg7cjDKJr3CVcTeAyZ8ArW8s4b2uqhoOLdVYb9Phl6QdMYCP5s0qsKSiarjRzSwitLZNTZDlv
	j4mH4zdW6P2GfP7bjmHaQS+pK6OA/k3EJp5gNLV6PAkUiPOlvGp0gG2cUIsQhVD3beTQlDtXYXSEC
	ZXk9r3p6PW7vtkfK48Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjw1-0000000BRHX-0Awz;
	Fri, 14 Nov 2025 02:53:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjvz-0000000BRHN-2Fxn
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 02:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58B93600CB;
	Fri, 14 Nov 2025 02:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906B1C16AAE;
	Fri, 14 Nov 2025 02:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763088790;
	bh=sM8hCNw/PGH4hSWT3AumbYV7ttYqEDcybi4gs9p5OI0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KVYEpqN1EHdh3xUzP3COtuDaQgWlT3nOklRecY4QiGQYQZORTkb28ikEyAyLAUXVT
	 p60sLX/h7Ody3E5Mg8kxfehKRg6fnVqjbpP1UHB1zReQ20CdrTE8zjhIEan5GYv7s8
	 ng/WwXSPmzzLpK1HMoeahErbH+EWgi+i8i8VnWPOiKY2OLGquoC130X3WCqtkPB7dl
	 lft0hrw9qXS7kmhqhiw49paNV+wRKmjREqZ9NfvFTbRzV/bHtbpGGNxsZaNuS2c1N/
	 E3sSSfQQ8rMs6XIjti1GwcZFWTLifKaDtl7xk+wGGse7V0B61d3Y6tIFR0zrb9Jp1t
	 ramovy4KKzbaA==
Date: Thu, 13 Nov 2025 19:53:07 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
    linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
    Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
In-Reply-To: <176297731621.2151636.2516355929483523874.robh@kernel.org>
Message-ID: <f5cc4e3e-ef66-7786-f9b5-f9d5f0846386@kernel.org>
References: <20251023160415.705294-1-linux@roeck-us.net> <176297731621.2151636.2516355929483523874.robh@kernel.org>
MIME-Version: 1.0
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

Hi Rob,

On Wed, 12 Nov 2025, Rob Herring (Arm) wrote:

> I guess the riscv folks don't care about supporting the relevant 
> features either, so I've applied it. Can kicked down the road again.

For the record: we do care.  However, it looks like this problem needs a 
more general solution, something that applies across CPU architectures.  
Lacking that, we might as well have behavior consistent with ARM64 - and 
for its faults, this approach is at least simpler to reason about.

(That's not to say that I don't have some personal opinions about this 
topic.  IMHO, we're missing a canonical Linux kernel way of representing 
device integration data.  The kernel would control how the various random 
device integration data formats are integrated and merged, which should 
sidestep at least some of the problems that we're facing today.  That 
would also give us a reasonable way to store superset data, such as bus 
topology information.  But as for me personally, as you might recall, 
I'm afraid I lost my appetite for trying to drive device data 
improvements during the ARM DT conversion of the late 2000s.)

Sorry for the delay in getting back to you, and that I don't have the 
ability to help further at the moment - 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
