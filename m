Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2628DC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgh/TE4k+xVS1lbST+XVO0kf+G8kUmBjciFNX6lVrYs=; b=JzKNGtW5PPqCoM
	Nk7iUm1hHU29JTKHRach6h8CVFkYwuQreN3SUqMXddgv/Rm3QF9qAVOKVyDCV8JGrKepOp04L2sm6
	s1DTQ0SG3eDwNh7KP5HQN7sufCiyseb1AhDfn8gDTP1FXTk3aMQNajyMkieRrP8yhxnhpD0/mfQQm
	zrsRmybp9hMmijgGQNaFhoQBj116/Hb2niwFrx9ZLZAMk9qFAWbTiC4j59zqmhCh01TVGjFfjmznZ
	y2+hB+gIBzluu06ShO7P0DELsmHQY87bRDFQ+OmgrjjDiYhYMS8QP5ncUnFjvcmQiQZ55d/J1VSFX
	ZuIToTHsPDoTAFqqtCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8HF-00000004gFe-0MTF;
	Fri, 10 Jul 2026 10:16:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8HB-00000004gEv-2GP2
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 10:16:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493f431e317so3698785e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678567; x=1784283367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vIQWYleDgGJPSPgzFWyTV1QrDZqaDu8yW8UkA/woeQ=;
        b=oWbph3543spQC8HhTDitwgVxYIxX747B5f0awoW1wwnqKyCieGZUI+6q13Arc9tQ0N
         ekpvXHGD7hPqfktD0p708idxB1GY1AUXxOnTiEEYnOt9dfirsza8pVL+kuOfbtHay9QB
         jIvxLrx9NWo1O79rQ8emSAeuO+TYdB9Ux6cYypDGorcXfLqSJr5yLn3nqtSTlL4+cDTF
         Fa+t1GzXrYdEZit3aJYM2iwmBdjZSr3gXVr3yLSyeYffzhb/OWxw88eXotjuRRdhChyV
         +e3tYOadylEr1qug0nIs59USnUDf3kRTDWx+G6tbpoomzMoxYc+6yE2tRNKdZYo79TDi
         BE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678567; x=1784283367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vIQWYleDgGJPSPgzFWyTV1QrDZqaDu8yW8UkA/woeQ=;
        b=KftbF5KqJ35Y1XMS2uj5N9rVat2VXTijkfttfBrBEc7q8n10mnDVVWg2n+aT6cRYLI
         x3/unGu2TC7h48Lf/Z8NIg6iUOBEAOjjC4aVzgAOsGFrDdNMK19QNAJEwFxCjCSWuwnV
         F8E8xPfH+mqTS4kZeslmGMTPEhX1eQOtSQ/WVIvsrEWDTl95ZKYiPx7uJbBBXQIkgNB6
         KrGTriaeQ56df5C4mtZ6vDM8MT4F6Su0WIM/wADlrOnleu//NyLiwkoEjK0xxk1Clfm/
         Kn+Vmcm4/9PmwFvRpSaP0+SNHK3rf8ggJNszcA6J42dfuVyLQIPJELUnYDIQ+H0rA6OJ
         IcdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNfk9fWcYfZzrvbFToHlDGKy0omE1Id1XTPNim6MYgrYbTbkK4d0bjWuCNM/JA3bbaKXSzHRTxiDUFHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRtU4SJ+PBFnrGR50XI8h5sCFPOvho3CUo1Mx5oZs7FBszkXUL
	Og80DArAHXfMnW2efKBNKdyOUdoiEfzdrWJN7i2TXexzm+LQzpthqFda
X-Gm-Gg: AfdE7cnHJK72uUrjtEz0dA9j2AbIEtmhAyLY4KhqTA94Odt4pSlOipORb3il4GWz+Ac
	f7QRLTnRuaTNvj3g2bXepNvQzf2dVd31y66UTbeSIQYi+7nq2QP88WW7i6UyHg1g5+qDLNdKlI9
	pxY1tRlIM4JSBsiGT+eGermZFyBOQvR2MpGxYpsKGT0SrW8OGal7NY2AFfI5U97oMQWx//DEQqG
	EdYRNLTsSww/OJFqjzflV0la7iBjN1B9Q1W1oNeKjOLWFluSOWDiJFvC+TMBuAekEvu0hk1xPD6
	K5VFZFzsNTpe6y7Pf2e5PEUoUQFDBBUNeJk8y6EBjwxzS87tpEv7u22tuIoYbGzMkQrvLFtpDTz
	+2WbHHyYJIl4wcUwlakGCRfAaPNGHg+scg8hqUJNVFLlJ+SLNT72br+YfxnTBWRbIngkNhXtgT0
	NGsGMRVQ==
X-Received: by 2002:a05:600c:828c:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493e68ee07cmr95829375e9.31.1783678567070;
        Fri, 10 Jul 2026 03:16:07 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f49755f9sm34621525e9.8.2026.07.10.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:16:06 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:16:02 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: shuah@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
	andrew.jones@oss.qualcomm.com, thecharlesjenkins@gmail.com,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: ptrace: Fix memory leak of regset_data
 in vector tests
Message-ID: <alDGYu3qkX2B6J2_@curiosity>
References: <20260710083437.489648-1-wangyan01@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710083437.489648-1-wangyan01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_031609_616504_0A78ACC6 
X-CRM114-Status: GOOD (  13.10  )
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

> The regset_data buffer allocated with calloc() in the parent process
> of several vector ptrace tests is never freed before returning,
> causing memory leaks in:
> 
> - ptrace_v_not_enabled
> - ptrace_v_early_debug
> - ptrace_v_syscall_clobbering
> - v_csr_invalid/ptrace_v_invalid_values
> - v_csr_valid/ptrace_v_valid_values
> 
> Add free(regset_data) before kill(pid, SIGKILL) to release the
> allocated buffer.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  .../testing/selftests/riscv/vector/validate_v_ptrace.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> index b038e2175c80..a388b7963d47 100644
> --- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> +++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
> @@ -75,7 +75,7 @@ TEST(ptrace_v_not_enabled)
>  		ASSERT_EQ(-1, ret);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -207,7 +207,7 @@ TEST(ptrace_v_early_debug)
>  		EXPECT_EQ(vl_csr, regset_data->vl);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -331,7 +331,7 @@ TEST(ptrace_v_syscall_clobbering)
>  		EXPECT_EQ(0UL, regset_data->vl);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -649,7 +649,7 @@ TEST_F(v_csr_invalid, ptrace_v_invalid_values)
>  		ASSERT_EQ(ret, -1);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }
> @@ -911,7 +911,7 @@ TEST_F(v_csr_valid, ptrace_v_valid_values)
>  		EXPECT_EQ(regset_data->vlenb, vlenb);
>  
>  		/* cleanup */
> -
> +		free(regset_data);
>  		ASSERT_EQ(0, kill(pid, SIGKILL));
>  	}
>  }

Thanks !

Reviewed-by: Sergey Matyukevich <geomatsi@gmai.com>

Regards,
Sergey


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
