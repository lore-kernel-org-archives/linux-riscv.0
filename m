Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F914CF3185
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 21:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRRsBy/zwZ/jynpwKDEbb+372I9GtiFCN2WZSMOUiuQ=; b=C6qWy58gJ4PN1HVs8UJBMqTQ9o
	8zKh4rE/1Orp+d1JOUa/0XfomzbwHT02e+6n4uHHi6ysej8fwxNJIPcgRFPgUNFHORCa00aC7zjUx
	1rIEjdBmI/RuBmYjgpgIWSHbMDCTgm+zWtTcqlHvIDRywJ5r5v3vlbIdWfs5FM8gztXz+StU2FJ9s
	RME1geBeYh7nz8xk7ezpgy4SyL9jsR6eorlrOI5HP9iQ/a/9zHWS4tL5Ow+/mxaLdoOAlknubeDKs
	ZwgEadCBB5OqdcEAZ1Y+x1NDaCnqLweiqPsYbkeushnCc5fADOSv7j7TAvTGhPGOI3B5P12gb7B9m
	qzQY/qBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svkhj-000000049dX-0NB7;
	Tue, 01 Oct 2024 21:46:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svkhg-000000049cY-1Xcj
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 21:46:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-207115e3056so53433345ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727819203; x=1728424003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NI7gIZ6lXNALBDXx17GTUYrDqDSXsA596QRPsZyrdEQ=;
        b=HgoJhOnQlAiYpRPSlumHcpHgxHBwd5kix289T18yDM012dc4qiVL8JDmOaJt5svB6m
         19iKJazbQVpCkaQV5/36Otz2a/I1rk8FA1HIpoj/SDTwJFbcyBO9rpZR893IOWewZTzx
         Tbo010FAZdDlPWF+gx6TobGaiqA/zaUn0F1iNh+hOst0fRTMlZYZSHf4di7fSGcOj8Bm
         ecWKg5DlYH1y4GX3pvx4dzlm8OAHPUh+zID0QMPnssAg+LPId2QLQ76cWwLqN8eyGv/X
         3Hv4GNIMJKhAsgU0dMTUVyo5VUucx+p8Btr6sQs8jkpaXBk61FyTMhkedpnX0EhcnT8G
         rQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727819203; x=1728424003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NI7gIZ6lXNALBDXx17GTUYrDqDSXsA596QRPsZyrdEQ=;
        b=F1E6nF2y3WxqDOQjxzRNtixfI3QcgDU2+grs7CCDszXE+PNs/4Vk6L6v31exL+nE3d
         vbdsZFnzYj70JASsoSd2eUij1rVi8Qi+Oyt7kXw/o6pkzBbvI2DOuU1j+9rRwnI1bRPb
         I0OomaZ4YdrTXBdDg+NCQBxtbBXEBirL0I8hIFoJUUk/O1VrpPAaBsxmC57+RZgSmq8v
         6YleE8uqtMLutsn9Yajoz5wwniYrWqRfQ7B5xxouXYHnF9vQRM8k1quWMNbl4K82jbS2
         4CAITH+HH5lY/XHz9OM36X7ZY60B7WeItP8QbAJIF8jZ4eW/UET9Vw3JhA+Q6rXnWrJK
         gtbg==
X-Forwarded-Encrypted: i=1; AJvYcCWLZ2OeKn2EEfjdFPZkhdcl+RfOxtHr4dXB1/msk7iRtTTvz0xVHRcjhDPTnN2JONusJdePeCxMw/K1LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYEUc0CLpuCbog4xjSnHxTVbZgJ51MITweFKBg5e6uWlwJP6yX
	UM5Dkz8amdhr/WTvSfph/BlbZZ5m/SJMj3ZSxCFoZZc/DypJe0flO88aDdoEmf8=
X-Google-Smtp-Source: AGHT+IHZV3IXCvzX283Z6okxtWKNux4YPD3i7IwxnTn7aGOH5zQYuUZMEM+naOwP+vJ3UKzd1e3dgQ==
X-Received: by 2002:a17:902:e743:b0:20b:7ed8:3990 with SMTP id d9443c01a7336-20bc59bc4cbmr14154355ad.12.1727819203103;
        Tue, 01 Oct 2024 14:46:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e61c4csm74275315ad.274.2024.10.01.14.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:46:42 -0700 (PDT)
Date: Tue, 1 Oct 2024 14:46:39 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH 17/33] prctl: arch-agnostic prctl for shadow stack
Message-ID: <ZvxtvxMwFvjgengs@debug.ba.rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-17-3ba65b6e550f@rivosinc.com>
 <e7c48ad8-5fe2-46d8-b137-e04046b7c572@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7c48ad8-5fe2-46d8-b137-e04046b7c572@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_144644_445531_EC0BE962 
X-CRM114-Status: GOOD (  11.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 01, 2024 at 05:15:08PM +0100, Mark Brown wrote:
>On Tue, Oct 01, 2024 at 09:06:22AM -0700, Deepak Gupta wrote:
>> From: Mark Brown <broonie@kernel.org>
>
>> This is based on a patch originally written by Deepak Gupta but later
>> modified by Mark Brown for arm's GCS patch series.
>>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Co-developed-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>
>You need to add your own signoff to this when reposting, see
>submitting-patches.rst.

Thanks. Will do that.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
