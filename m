Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69156C78829
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3CjegJAVb5Kh2ZZJDwlOJaShETkNCxHn2f30g8zTBE=; b=xeUrmUTp1RsZ8a
	z1UR6LcQbH/upAhBYbosWOw/DGv9Q8KLb11rFyuKAsWG8us6fqW41WEAeGkaY2bGmJkKe8b3c1gkb
	suJftDfdH3JZWnv0CMBdoNChyzvNL85fMzH+Qud2EgbAt2M1WkHzELMR788gdkTKb60bXJOWr2ROn
	S8poC2S+s6AjDGPevATpeGcEXs4VVYHkjROPa+iOV3l4u8lhPboHfG/E5AMkX0grdqLjbddhjuslg
	+OHIUu68YIhyqm7x5PXYcYwTETJxnF2v7r02JWflwq0kWYEjwelONXaS4DYbsbqgk4b8nss8gn7wl
	ieHZiz9LtfDyceqipZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srcAa-0000000C7WZ-0i46;
	Fri, 20 Sep 2024 11:51:28 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1src9j-0000000C7RV-2cgP
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 11:50:36 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-2d86f713557so1377745a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726833034; x=1727437834; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=DKvrRaPpLroir86Sby2N+R+SsXcBJmMhSzWv7N4XajrMokzFFsqXi6UtcMZUIJj2Nn
         Yp+3VSfVdsCE2iSa4yTvWKw27+cFR5fpjmyFD7EYKdzZ6ZP9qJO8TeWEfc35x6BmB7rl
         6GYmYGK2uVXmaP4c1PaqVJm/Uro/tZs9NF4dl34NHN8xMavH0O63mJZNkaVTEgaSPkq5
         s61duIoJCA9qE1GStXTJEKV22kHh/yEI5nhwJ9iEbs5a8lN2ETrQKTAsvtNivgUbYw97
         td8QcQYUsf5lddUYVeVVHuosNs5Du+Jj4FFJBtviKFFTvXakpEk0zE7dlTY7FK879SN/
         uoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726833034; x=1727437834;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=DHmNhNcIlfOsHqxfHTlvyWzbgpNw+hTriesp5/gxFhM9ose4XZ8R7FxrYLP/sbdFJF
         WbNV19voo/+H1jsYTUvX0ZXw7VBzPuxZwfx5zbJ2S3zwXoJKB3Sy2qRor7m26Q3OJG2w
         xkxrESIbmACQNT0n0YAVTBXIbrTZLMoFGACpCM5QAX6ujH6Qc4e4aEq53kCwtn27iB21
         sn1iS1pMMRqYc7CgOORi9tZ2rzqIXGHSFUS3bS3wx9T6tlL+CpYQ7RPhTMuj5URUD812
         siCYGbTkWvA0rYwBUx44bPUz6ZEEBDsCfDHgSwa51nO9dt0xQfTJIC7wiaJa1YERnzav
         MYYg==
X-Gm-Message-State: AOJu0YzIk6pI+3gqaB8aQ7IHDCct1ao+gh/xR1hMMSZ3zCOYv8S4DJjF
	/ehg+r7n3gRWtSvn+4SGHCMPGohfs3d1Y11sEg8qd6IC5G5qbbfSveI+HB37
X-Google-Smtp-Source: AGHT+IGy8AhzougFdnD+Nqto0xAO3V2+z/etKOAD/txjL8ZNbrguiZen6RgO8vntsyVcszx5S9Ibhg==
X-Received: by 2002:a17:90b:693:b0:2d8:7a1c:b7e2 with SMTP id 98e67ed59e1d1-2dd80cd738amr2539973a91.35.1726833033709;
        Fri, 20 Sep 2024 04:50:33 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ef31282sm3827693a91.42.2024.09.20.04.50.32
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:50:33 -0700 (PDT)
From: Michelle Fangman <mutshenamukundi@gmail.com>
X-Google-Original-From: Michelle Fangman <michfangman@outlook.com>
Message-ID: <a5554b36e19c4e8767059d0a2dbe753394f5eabdd6efb36be8b727ae5d06841a@mx.google.com>
To: linux-riscv@lists.infradead.org
Subject: Baby Grand Piano  09/20
Date: Fri, 20 Sep 2024 07:50:31 -0400
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_045035_679752_1A05B764 
X-CRM114-Status: UNSURE (   3.11  )
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
Reply-To: michfangman@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast who may appreciate it. If you or someone you know might be interested in receiving this instrument for free, please feel free to reach out to me.

Warm regards,
Michelle 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
