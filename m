Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE3C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 23:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDIdCQ/T4dvKW8rUI0B9/1W4G3LJlPqzSHWiRvD5uwo=; b=gvYTZaoqtFtY6k
	tzZ8S4avWlH+LQTSAK6QuliCPqNQuFqFPE6ufWR7PYfq6K9DNOAwQ50RbOlaDIMRnOX9msMYMElYu
	dKnBZsDCujRU3vquPYIXyM+lLt5wE9Y2yufAr1i1WGaNgzHCs3i126jhT8ChUg0qNTENk0cIQPIH+
	6eUdFF+GohJ22tIfx5gXbdnrrMBH2Fii43TwS4az7ORT5HZiQb7t2byxk5MjfYtJKOZ5vbeQq4rbv
	Kfr4Q9MElc7raN8uKnS6c1lcXKGsTw5/BfHOHdkMsnQ5UAYurYZbxv6kFOi2Y1kulYiVaBQuV1fXS
	LB0jhajabkqW9Tr2Mtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvhO-00000001Wqj-2o7t;
	Fri, 17 Jan 2025 23:24:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvhM-00000001WqC-0BHf
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 23:24:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21a7ed0155cso42668735ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 15:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737156259; x=1737761059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UDw+IyQUwIWQ1B8ACuDHipcuMtsvQuIJkx5q5mHmTo=;
        b=sbCU1jbW7/aptURUMmObzKTD4BHeUPmXYBZHNrBjRc1IfnWo1JthDgerDSIh/SnEj6
         ZTBa16Ep0InFfreMKopz5Z/lhaW09nfbwVn5MKHDPn0VLn6s/Yq3AOq9rEWb2sC8XWwI
         lOw+KsrYRK/p4/amI9F83dqygv8NfZ8e862Rc5KIKoseUNel/LeGvI/J5nz3g9ACPuko
         d9dID749SITOL8oE5cIddAhlZfdkiaRnv6wc3I9bAk8F4AEjTFAqeJWE8vtT3b7vCtC4
         EUgeGdGkbntUAGd9RK9f5x2BiXl2dsjJ5vK9W4QYIpULI11eh/uwyfY4aB/E/xHpEkgx
         1G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737156259; x=1737761059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UDw+IyQUwIWQ1B8ACuDHipcuMtsvQuIJkx5q5mHmTo=;
        b=HXbvEu8TWsXw9YI+EEFVMcl1YMGY0aIOnEGu00Qk+MAvfVFa9R9OQ51AaCWQ2OLdP3
         nszu0ikACfzd5ssG3HZ1BGKxeXKXUWGuOGeOJOsf54oqpBW77mMHqmRQJpQ72wiY5Ife
         4TTayTEIljnTZNjT7Rf5Ox2Qd7sDtkIvB2Vr/XPIj1NsPUxzbC3cwhPe7H9asxxxdhs9
         gzmNRGUnKreHh+329dgWyF4JDp3Wnrs5UiSkyUOqHuYp8A86Pm1TPEg/0eJQ39iH1QSZ
         50wMEYZRZvF1c6ahOdpAZ2gbgFOtIrLKi7yvZIu4nxJd1S5GCEjdXF3BeyUfg7xq1T3N
         9oAA==
X-Forwarded-Encrypted: i=1; AJvYcCVQdWJps/4gU8YSHovLieD1oHmMYLjhvNUXhMmvSlVffUXdPVKPr2w8wScmQCZAaYPo03EO+r+hLTawWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk+JoxliKbGQRt4xH3uLSHhabNKRPw8MpHf85bFlVhTNuo9aJT
	dp9uTPU+JfFGYfAbRO/CFnFNQXcaWPTNESzNg+4J5gCyPxcAfczdqrU550sKR58=
X-Gm-Gg: ASbGncsJK4nNdJPXzPQXJfJF9rAuCojNQcJlJWW/2AHorC4c7Pt3CNluikQqPA97qhg
	bVCIqPl4oOKUswuqybKM0QFjEdq0XnOopzs7l/S/cprWAeX1hxSLwT4e5RRp2mdeWR5/6cdjUqf
	zdGvTzS7XDuPnWh1rfHFQp9N/NfTpg6iXBMrLaNpu7gf9Tsq8fiFWXmKyBM9HujYsy8d+aUyOxP
	3s43ltFcXuRwtJniA+Vzi9IMn7PER0o05UgsjjJH+jUtdCYi4ak0aYbA8Y/zkz6cw==
X-Google-Smtp-Source: AGHT+IFzTWQ5g1o0R+frM/snwoa3jqh3zT9Dp4Gow+yglGNd+skyoQG1HNTlIFUjs4YLu30NW2OuUA==
X-Received: by 2002:a05:6a00:84f:b0:725:df1a:288 with SMTP id d2e1a72fcca58-72dafaf8ab3mr8180095b3a.24.1737156259214;
        Fri, 17 Jan 2025 15:24:19 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm2540850b3a.69.2025.01.17.15.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 15:24:18 -0800 (PST)
Date: Fri, 17 Jan 2025 15:24:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 3/4] riscv: uaccess: use 'asm goto' for put_user()
Message-ID: <Z4rmoAtW9vOuU4vz@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-4-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118230112.2872978-4-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_152420_078999_F39ECA02 
X-CRM114-Status: UNSURE (   8.09  )
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

On Mon, Nov 18, 2024 at 11:01:11PM +0000, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> 'asm goto' generates noticeably better code since we don't need to
> test the error etc, the exception just jumps to the error handling
> directly.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
