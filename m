Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909A606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBXlRFaS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kJ/T/wor
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yi1yXlsEB8DNkzi3c8ib7hyVSSJWWqulYzIDKYfzEfI=; b=QBXlRFaS3Z5EoJTAeTKxuh8VbG
	d/67Q+jvSa9P7U0SHToPUG6eTiqX1smiSlsts/zevSYeGSQA1p5FIjk9efrpjwbFOsrU/uTh+4Ojx
	oU3bLN3qUzmh/3Rst9AAhjF0orFtSu8mn7o7nl4lRv/d4DTwuJr3cUbGXmaXVugdR2dd7CFWZawXd
	Jsmri5XtsCe3xoKN21FeviCQ9KiqqdfyL0sT/OMFdlrzee/7nHS6mozAKnybU9tI66Nwb5/uNx9s+
	UNi93uGCLRIm/GLl1dmKth+sdE9B1RDsIrAFcRXTlsW31DLNpY0HqzAjND3xnmrXbXI1AKy8LnWgG
	5ZmFtCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXE2Z-00000000YiW-0xPH;
	Sat, 28 Nov 2026 08:44:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXE2W-00000000Yi4-3jsy
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 08:44:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e47347279so5365441f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Nov 2026 00:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795855451; x=1796460251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R7DBXtHhJX9+8G0Ygqha5RnkE/7tAuVrWeLxmIjqKHI=;
        b=kJ/T/worqh3GP0Xswvg3daOCtecOKlR/4hV+K3zISqO3lmPyuRu386D+IE89MIzU8u
         +P96lqRnL0Dcjn0fl4GbQSP0w3r+RWBBmccRHABu85S+3d6D1UHBqOK4xFWvJN4SwE/6
         D6P1NbbkX5Q5u3B9PJoCA6Jf72vFW4P85xz6rsbidEZVUA5Adp3Ebw3jcpdpEvKHLnhx
         fpgCMjzzWaY0BhtyK7YYsyN1kPXGS57f/+m8Xv75aWsl/Bvdcwl+0sw8veCctw8VaHh6
         ajd6Jm5Io6rczfjQi9wxn5sTlikKbo+UBLAqaXvThjOzpfDR+PzyMkb39MiQfYVNbDQU
         1o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855451; x=1796460251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7DBXtHhJX9+8G0Ygqha5RnkE/7tAuVrWeLxmIjqKHI=;
        b=nKVNrSTiyk//w8s0nEXwMC+NNgNCD6XGb5uOrQMaezdqnOto+lTXo4jaIQ3FiObnIg
         Edbb09i7+RfOng3u1o+LNn2zZvBpWPM9UFG9HcszBQLog2amOfEt3Z+ARad7QW76mQY2
         cIr5Ivdw3jirXkfKkGrw7TNRJa7s1xuPW9lKZbcbuV/uoZXnmTGB4UVoF5V3vMYdwQhj
         pY0zcvfEg0MuQ8xNyurMAHeOETZFw/seUUa7jJ4Ot8GOTYHEObBbAvsBsScTUDcwZZ93
         6Eiyr/QKt7C6EDp4FDEOBJGCavL44w2eLu7DHr9SZn8XzJC1fovpCbzVN0gol4hekAMl
         E1dQ==
X-Forwarded-Encrypted: i=1; AL+hErFb59ENHN305it6xvsQXnTLgGwuDEqi72X+Q648klF2ZdJYcisbk0ChFzI1q+b1/wAi3sXwHzSTyw82fw==@lists.infradead.org
X-Gm-Message-State: APuU4Z99GXYY42gPe7Ms+dP+NnmrjNxyqmHDqdUUY4+WQBxIcSEQGBBH
	3k/fFKyetR7q+yvJ3wVUlceAyZPuRambdrB5mvsJk4U0kXBn7cAnzGki
X-Gm-Gg: AZFdTZeTqXEAAdQ8CtVon1+sJou7CcvSOzcuIWiCGzOKRIy8Y48fOdP2XcY3OD9yWgN
	Cy9qiu0Txt1+ZcN1CsHotswhpCwGljXMTCj86m2Sm3tPBVD4bJW/rmgEc0KP/8xFKjSwtQg3A6i
	z82H/VcQua/+pd7E1Zq61A2sZ9kIIr4HtZuDdDLdXZErVKFF2F295Dec0x+iphtI8gXdIzt2Pvb
	2FMLUNc1LskjYEWxH4I8paSWl2+knL61DQZCYwEqb3yKQwuG3/PpHPa+jw8zwhHg0t+Agjyil5R
	wPNXy8g6J+XGRpCgpL7MA9WHXS46e0y9HK3ONMcBxsFsvhTOA0oClgoWg7bhm3UDfL4hHIa89uK
	4Qb9FQLsW0AMZO8y9JFyybeWMUXQgh5CFYazf3x/C7TzFcifLocdGfGpUxfHDtfpnxtmQTqYgzZ
	fnmKMcrIxtR+5TlIJFEJYoP2ifGCALPPBddjAeABQkoS5Hsi6SamMGmUtRU9RqrExJeeZ/E3LmA
	CVVpvTxyICHnlPI7sm2PEEMsGFhnlBjXikJsg84nH8oDegaKQtNbbB0cPCwZ413h8GxuY8UJhI4
	cBpoX2jQ620mGkz922r1z6gW3+FT5ITbJj5M9/zlIYgPB+6fXOR+expZ1CgpuIXQBR6uYsDf2Jj
	8KB9Dq4yV8I0S8DXrM4pBrdtBz7JmQGX3X3k2phg1JGB93DXQ8cD93kmKm97rALuO
X-Received: by 2002:a05:600c:4e0d:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb88922c6amr500841285e9.15.1795855450415;
        Sat, 28 Nov 2026 00:44:10 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm775982895e9.7.2026.11.28.00.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:44:09 -0800 (PST)
Date: Sat, 28 Nov 2026 09:43:39 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Always inline on_thread_stack()
Message-ID: <awqSiWklSdnx6AAB@gmail.com>
References: <20261012204211.3351-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012204211.3351-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_004412_932773_6A609ED3 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 10:42:11PM +0100, Karl Mehltretter wrote:
> Mark the helper __always_inline to keep it in noinstr do_irq(), following
> commit 1894a4030582 ("x86: Always inline on_thread_stack() and
> current_top_of_stack()"), which fixed the same out-of-line call from x86
> noinstr code.
> 
> Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch. It has been reviewed by Jisheng Zhang.

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
