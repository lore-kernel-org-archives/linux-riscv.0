Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC441093170
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ije0LPwFr6My3FEGUBma7t+5rx3ilUFzU29G2HE8d+Q=; b=PfUlPPZdZZ3Kly
	SCkrwl7Y96m9kZ9vpUn/iJ+cqJYM2viT4u/yKDYim4N9yqsDYOHqPCelUSP7VceFiWozRbLgQkKTg
	8zG4+6ecOzRTXkyuMNvTt8cTK2LJRpuQ/IaUJZma6+Gc51H528kim9JBl69O9kkCiT2bDuEyWMgvu
	PflUg3I6z03noyyjB4nfdQoG/N6iVj+2mPDip4QwY/BHMpkZomOyEnnHmGy1FuL78PfFSmLscYY5p
	ZpwQfzFJ9DG85L1+JxyhCpbqqGoherQVIkkS5O//RRvZ7PLsm1jMnubvZFqm0MbnbLtvhWYfESqMD
	MUh5AXy1nRToBAeAwIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ocN-0000000E400-3Y9v;
	Sat, 21 Mar 2026 05:11:23 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ocL-0000000E3yg-33cO
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:11:22 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c742d4df00cso1069272a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774069873; x=1774674673; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=bUB5JwHHYKYptmsax5FiwodWtbIJOAPGj6MtvcDZteioqwqjmo5pwzqwbJaUyZ7PsC
         76Xmw50gDF6bG1eQmQ5aj9alPrGdmg4XqPO210FlxZdJSXD2agXM2FYGH7DOys/+2Ykt
         C4prUM1KbQEho7jGjUJZCNGZHXhSs6F6/5+t4xvSq6q6dgZ1kwtxNY/aG34JZ/T54vLA
         jCPw3WNAuyRyksrWmG5UJ2Yisic4Vn0qy7Cf3FT0XrFPSIyCLPfV26H2gr3wp+aQxtJk
         tVPGnteyrN2RSsZ2i4r1XX06ky+AMTyjs60tqXQ+AasxrY3VB5b9TIkq83jlxZ05CRXd
         E0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774069873; x=1774674673;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QxDv7wA5vy2wx/iALi99txiEfbwQ3ENlpnWZYhHz0A=;
        b=beiy0jJ4izpGrvcIR7DkDyrjlCSeX5nZmAqAZAXYIRGQFzk8ey3bNOkIP9X4XEQ23C
         qjtpUV4D5frLvKxYqKq0zK1mt+LbZTt0S+jDV4D6Zcg2hSwh6K6BiK7Y0v/5linJapE4
         anl9+u4q5F80ALsDajC8IvXsb1v1GsF+sYaq+eXc/nH8xRgEIH5vyuJsktAP5vq/79tn
         tFUvb+HEqUgi1GrE2PhxhmZpoYOI6tVOOcpdT0/2VPPvSz4flwnCsnhxDZO8zWANFrAk
         mGkI/J7mO7NO/MyrQbCbR0X4XK1bkMbFE62IYFpbklv8eJcO0allRcLo+MW0SedYocVp
         i1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhIFI5XIYvDSys2q9Irmeq5oXy0shS2l82NA6Y2o9WjpB6m1o6IzD14cMYyQe0HL0wtHYPdGtEBYbDxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6QHgeh+AiW1cYCcvn3AKTdfsRYUyV4KBd6kvk5b316BlxmNus
	SwuL/IX7EXwJrEurBjj7hGOz8Zru9X7aLkGGk2hfgepYcqJ/Oca/62Ix
X-Gm-Gg: ATEYQzz03CAMdu1fE/OLK1Q/k63vcSO0yplNp5mpLWa4PXOr5HX19S93cVpOH+FTzUN
	rV9hYCxGRADST7z7if22YDNrHs4QYNCCTb2E6T6mWQzrxX5huiuI+ufKtIiQHv7jafZGQRu2ogE
	5e2dkv6LbtK2w40qwBwQqRzqiloyM8E3YctTYp76hYY719l6DAkIttN0WGknldfU01Nw2kogtQd
	OCXnprJZX/uljZrHpbp7FkiTwBOMpto5VPPzIYfQlmDNwUO14cknNUSs18pPwtE4/oYA+u6r9QF
	RYkPHRthjyaq3s2MQW1nAXsZvz0/QBKX0vsRA3uc3yIDzW6HqoBD0OiNxtiUW4bXL/FXzg5fGRL
	ZVE7UDdtnZWq/1TjrtLnEb1FPObqwl5UrYjY+/87PfC1+FEXFdc6yhVSnelDcWUF7ht9v1ZmFfy
	aog/k9KerJsBgS2sJUbc15xQ==
X-Received: by 2002:a05:6a21:4cca:b0:39b:9c3a:f54f with SMTP id adf61e73a8af0-39bb25e7511mr8216718637.32.1774069873215;
        Fri, 20 Mar 2026 22:11:13 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm2729778a12.16.2026.03.20.22.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:11:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] mm: change to return bool for ptep_test_and_clear_young()
In-Reply-To: <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:27:48 +0530
Message-ID: <ikarxctf.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <3fa94c3c89fd93fe22c8cb59967f064787d686aa.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_221121_908234_FEFCC1D7 
X-CRM114-Status: UNSURE (   7.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> Callers use ptep_test_and_clear_young() to clear the young flag and check
> whether it was set. Change the return type to bool to make the intention
> clearer.
>

Right I checked all callers of ptep_test_and_clear_young(). I agree, we
only need bool here. 

> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  8 ++++----
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++--
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +++---
>  arch/powerpc/include/asm/nohash/pgtable.h    |  4 ++--

I looked at it because of powerpc changes, but ended up looking into all
call sites anyways. So overall it LGTM (and I agree that we can remove
the unnecessary externs from function declarations)

With that please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
