Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8320CD4F3C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FR5cRuXBO+9uYk7u2GIUDW0IcGIgrAH2eGyzqxQGYo=; b=2vyyZCnKncwBTq
	zODW+PU6NmNqACUihb+uFBZm0y5iBi5btVgDo9OeF2ZjhQym8waAxL8GXJfNVjKmV6K6WNAOwWO//
	ad9/1LuMQcdD6be3nFor54/wW/ldfTae3zjs9sEPHPSugkB2yqVYazvlIAueJ4TYSXrEvbwDqpTO3
	29XNvuB9X7HTIFhn3OMAhbXndOExWWpE3ILtd/CmfYfMrtW3kblwGLFDeOZZw1/mhFkl4fgZkWC3s
	fWIZXgZBXJ/ePUBbvIl3PKtoPTbBokLJPaJkgDpynNfrBWGNIukJ4BPUG2dngAoUdTBGQgYF43BdK
	BH9OLS2jmDePS7X3uLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQc-00000009jl8-40jL;
	Thu, 13 Nov 2025 01:47:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQY-00000009jin-3k0s
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:12 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso180047a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998430; x=1763603230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qhRE3U098N+H4DinfMhjjqM++0OwmN0vpW3M8gUQyI=;
        b=kRsoRfb8UBmSspzooMuGDf96iZbHzuhQxWBmAzMzM0M9aV8/LXNwSkMdh4rzEymKB1
         L7NO7v2K8a1WFcQlDFWcCbLBT+wuTbAO2JjSlZ0iNQ7DeAfjvc9o7FZJLyBZC8Va5vKJ
         bqyvsHH0kl7j0idQmGjgKsAd66e6bLlWtKJrus4wbQ+JXExnFX0C7dMx6pYhn3pjiEmJ
         5ZK0dT/Hu1dRPmpVYkwfJlNwiq+6lf9ZPoHqGFoC9P1kSzXdr3zb+wc/ZoGJDWo/WtXc
         2cejKpoQF48PlJbtWxKdk4LrKdX1tPkhcSEDgDPIsXuzrPM284c2NLl9zas6QSex/ZUB
         fFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998430; x=1763603230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8qhRE3U098N+H4DinfMhjjqM++0OwmN0vpW3M8gUQyI=;
        b=d62mfXd5CzYgH4by/QfNBqoTLREQFWXNT/89xwSVnb/Yz8XxVer/8/NH9i7EbtbNGy
         CflmG+z2A0zSn0FPqKEGMnJ9sy8gk5HTfEYyOapgLGaOdKu7ud1mXCibH7Fuao7WyNEu
         uDV254AiG5P5Wn87BPO8skc5okT7Nfvi1d7S3A3+N5/7n9F9i+HM01D/Lpy1ufqu+Unh
         G4khKOMiWmE8ZaGCME0ul9VRSXv1JUrSMWzri2nygGgL86TjXZS15iswikexmG9RRYtG
         3U0U8GElpHrHQR37VE0TCTT6sDi0GRaXp7ZeclXERqO3vGcwWUYTqZrHTSCrJI32tCSD
         0yLg==
X-Forwarded-Encrypted: i=1; AJvYcCXGm2lXxbXSKqnq9je25BNK2KkE4WhUGdsXxcrd+EeQmk8GltOeUmyO12CFGBEiD/M/1aVvqrGgJG16xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72YIkPSYj9hEeXL53SvnvacKQOinU9iijhQj1Kyti4JAN3EII
	W1ARnVVbt9dhNjYgyvyB3kp1eMRgJnWk2fTc24PZp/k+SZKajVe2qGamfwQS1IdUUNM=
X-Gm-Gg: ASbGncu1FKyWbhR4S5B/IBUsGpX5rhmKy6ROgmkWCn0IdltxHpwoaEI4bsTdLno64nU
	k3jcv/WTf8CIuLDz3aSZPxpNCDx2Kr7ItQwuTJ60jnKM2xL5isjyehmZ1OmA1DFGcyDP+6SMxIK
	J51tm2IsahI865P1vUc4+yNC9GIIBNLVwGxNiPEyZl7mDF+Taddpss26sJE7aOM9C9UpPpwL9ZR
	NjrCurR1vuy/LJPZr3VTQDVXu28FQ21NxmMQZUxQoAB77Nt1HGnNur45Ri318Pqb5k/DHCahrQ8
	mROu/nQGebGbOHSHb5eQ6KcZzYFegczLRvZS6c1uS9yxkrAYHsjAr0URLUqQXUhEAplZyNH6N3a
	h+6WlwEGnH7zBkTO5Ae1YrdjCDpRzAYezamnKzluuOv43EwEmCkagmjQZu7VZJEs8M/07U3ISAU
	j6phDCnkqTKwZu+1KC+VOTug==
X-Google-Smtp-Source: AGHT+IHi0LBlNRw0NLDEi/GdsrGYk9xzGMjJnjfOoAMMFPTbg+YMkWroJLJ/pOiFoVdYD5QP6kQ95w==
X-Received: by 2002:a17:902:ec89:b0:297:d764:9874 with SMTP id d9443c01a7336-2984ed46fe0mr62614185ad.21.1762998429959;
        Wed, 12 Nov 2025 17:47:09 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:09 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v3 07/22] checkpatch: Warn on page table access without accessors
Date: Wed, 12 Nov 2025 17:45:20 -0800
Message-ID: <20251113014656.2605447-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174711_227499_D7B17B0F 
X-CRM114-Status: GOOD (  12.84  )
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

Architectures may have special rules for accessing the hardware page
tables (for example, atomicity/ordering requirements), so the generic MM
code provides the pXXp_get() and set_pXX() hooks for architectures to
implement. These accessor functions are often omitted where a raw
pointer dereference is believed to be safe (i.e. race-free). However,
RISC-V needs to use these hooks to rewrite the page table values at
read/write time on some platforms. A raw pointer dereference will no
longer produce the correct value on those platforms, so the generic code
must always use the accessor functions.

sparse can only report improper pointer dereferences if every page table
pointer (variable, function argument, struct member) is individually
marked with an attribute (similar to __user). So while this is possible,
it would require invasive changes across all architectures. Instead, as
an immediate first solution, add a checkpatch warning that will
generally catch the prohibited pointer dereferences. Architecture code
is ignored, as the raw dereferences may be safe on some architectures.


Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3

 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92669904eecc..55984d7361ea 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7721,6 +7721,13 @@ sub process {
 				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
 			}
 		}
+
+# check for raw dereferences of hardware page table pointers
+		if ($realfile !~ m@^arch/@ &&
+		    $line =~ /(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b/) {
+			WARN("PAGE_TABLE_ACCESSORS",
+			     "Use $3p_get()/set_$3() instead of dereferencing page table pointers\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
