Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EC1C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kovPn4bbXfP6fIEyBg0PqZzynX/AlIjYONPJS5UpwBw=; b=ghmKi+mjkPwKrx
	fdWfPH6thvyvAqqXjBCDDStA/BVxw2Uv6UhUCL8IPRp1zaNkkcmPLtii5YDULFuGjt5aqY3GN0J7p
	431Pj7e1r5xhWDFbTwY7GbBPn31+1fi2Cwi/qc7a9d22aA8uWl8tr2FkpXOngZ9xypKKLQclLG5o5
	uXfI3c4Y7lnJjQKToxXVS+J9ZpzqSRSXScZ4EE2F5bmSCiRaOfKvJqM7WjdqMRxpZmXJ4UZM1/fIu
	fyJi3TzVouEdUkmwOKCN6y/pZPLyG5yYHR6b5UeiOdCunE4xLxtTHmCLWySASrMQsGDNU+H0IwBZB
	E+/j5RslYeJxhfnMaapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFw6-00000003Hoa-02aE;
	Tue, 09 Apr 2024 18:11:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFw1-00000003Hn7-3qZy;
	Tue, 09 Apr 2024 18:11:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e220e40998so37525685ad.1;
        Tue, 09 Apr 2024 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712686264; x=1713291064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=BoKP6lWfNjdUd6X7n275Ju/TaQsYQW+u5DFbwZiBUKOUNtZ/DFMZjfQnpyAKjQsNoG
         v2M3OeqyDasgj5d3f9nQdS41iG+kqsSxUb5C6b/4ngoVS8nhDiPPAuIWjdRWRsTv1lRK
         c7RddFFEEamAqz+CNwpcL978miVRRtDoRVOlSkY4skNvvxL4QuUTgF1lzrYajeVQaeW6
         Z+P1Wy/TBcifvYj2cgzDkT0eyryB3Vhss07F3jQ5vHW5SwdARzF9fUnG8/CPjRWziF8P
         dUq7CqNikb77KpD1RfLTLZbo7pqZ78Q86eq1sHlW6iBNkuhl3FRDWKBUAtVoR12VKbe5
         oA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686264; x=1713291064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
        b=JlmjfSkwlEz0KsZK5voGD4X0oM7urVuncjHcYL3puDSmf+Kjw3prklUFhu0nqNkX4r
         ON9/CWPW8WriIjY4hJfQqOwdE6L2rTzyfN7fMa3jmi8DD3wwGUDSK776NIjpmOp6jgfe
         gx3LTbt8NYRO8Y4OzSdozigtLPIjUuJ8HcYDQVMKGdreJ7UaDajuqa/UYa2aT7Z1DCpf
         7NCFZxsLvwABqXqPNoIr10QWNFccAoAuFq6I8Ny0N3YOooQdezh5M6e5dBGVXV3ePU94
         Cgwf1JPeOg7aFQEMgLd1G+OI8y3vAJYNveBEejz8F6JdFHcskARhN4EpSiN8bAQLlljW
         3HiA==
X-Forwarded-Encrypted: i=1; AJvYcCWloP5/RMYCrQREpdpHkPptuFWPVqwoJH90k3Miv2lh6O7yF8YwWxiM3z5BygfyLRLOEWsE/bND9neK/6Ccmm2PzS4mRqfFCldR6y3c2Ql3IjvykZR2Y9hovsNRsmE2inyNqNUn7wDsW/uoZbpHJH9mgiZsGbg=
X-Gm-Message-State: AOJu0YydlCdMUa8EdF1msVOpeitX5l9kPE7P/cUfxXcVZZOooJsCed3f
	4u6/RoBYFpwl5u9kE9fwOybePsCSktUOyVhTeYPW3ncp0UE+/ZbB
X-Google-Smtp-Source: AGHT+IGrjPVdFECKS3becNGGDDo38peM0R3uLnfzfKLi+hNrIYGQpqn6EkGBto25qlTyktqlNq6njg==
X-Received: by 2002:a17:902:82c8:b0:1e2:3e1e:3d9 with SMTP id u8-20020a17090282c800b001e23e1e03d9mr529751plz.63.1712686263974;
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902f25200b001e256cb48f7sm9195770plc.197.2024.04.09.11.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:11:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v3 03/15] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <aad25d52-83ed-492f-9d56-71d26895173b@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-4-linux@roeck-us.net>
 <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_111105_980933_4613FC6E 
X-CRM114-Status: GOOD (  10.04  )
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

On Tue, Apr 09, 2024 at 04:29:42PM +0800, David Gow wrote:
> > +ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> 
> s/CCONFIG_/CONFIG_/ ?
> 
> 
Odd, I know I tested this (and it still works ;-).
The additional "C" must have slipped in at some point.
Thanks for noticing!

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
