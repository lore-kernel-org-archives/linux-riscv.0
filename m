Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAC8C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmLZQUmfgANmt25PBUue9CGf71TqZso6Nfc7jTPFnsQ=; b=WsVh4RPijOqf7b
	GuKh4QSBik1XNSmx6I4/ETyXzdjKMb2atwP976zuEmAmU1p0HwPbRZVEsr+NBZtIDbhH2e8jmNJgt
	88DinijCQSslzOS64tojEK21uf4OkvrLaFNCf0viX/syAbb9Z9fDch+UHvPIwSbMd0C+H9a+lrG/f
	T8FDnN8HUUMYOQc89k86fFviRqdSKPOuXmfPD8Odw1lGpWtZRw/by2niLIUsKwipr+BfvogCQ54wW
	I5/t85H+CkkXC9TcaPWaCBz93l6jZXUXaA38MhyXlXHif7r67ixid7Cd7AedgPLYFDOmbSvQcfHO2
	SKF8UiNdJ9ohNS+F1kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufp-00FytK-6g; Thu, 15 Sep 2022 19:37:21 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufl-00Fyqm-Hr
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 19:37:18 +0000
Received: by mail-qk1-x734.google.com with SMTP id k12so14135875qkj.8
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VhWltIWQGr4otQw1ais9xJMa50uESeMiXqro3LvTwg8=;
        b=ZOzER003YVUI0wX40DWwfYnP8PmDaWJ1GUNNHRfVg+RBqRnDWZhobIt10jbRXG8ikP
         34RlHzRathp0u9FK7XGi0BLgao/yNkGHKjbQLgAQez8U/Fhwf9EYBjieRXyIlHh6xXY2
         OevX6u1otUPcmldEFrNI5xLckhnjUCJ0SfDqAcm4iJwRkTv239iIvcgO2kRWb8jlWWs5
         5j9nX8N+bM4li1mPoUvQv3damgywG3DWnKZ/rNZkmx3EnWm9jeo6MomLeWsIqSY88BrG
         D2mcSfMSddHnyLQjz6qPki3X548HVK9mZUvsHKjjIfayptk1JD4au5JFBBJkao5Oi76J
         ro+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VhWltIWQGr4otQw1ais9xJMa50uESeMiXqro3LvTwg8=;
        b=wWqZSkXFPfqS64nfJRyS+DcP5rf9OVIG3iId59kGcIjFRlXRAG21aR32G/pcBnXgVF
         5YHDH2+V30j+0HYaItzwm9XFBrdbYalALJ+ubqllSrAjrMHrfHcwo2tLIAbmKl5cJvCa
         DylakWCl1qj+j0jqU/j8DFJECB3xmn+ZqNh9jWqjHNnJVlGxEBPmrxQ8lFcg688LopK6
         076t0dY7INDRGbDgxUmgVYPZ8gEyFiy5EnDdKggZUcr4PzT9Q+eu+SDbA747SPMZYRXZ
         DRIIpTsUrNab1oi/K7f2pWG8PUmrDwPBqCjmC0e5Z6n9VdDoPIemImLrQkH4bq843MGF
         mr0w==
X-Gm-Message-State: ACrzQf0L6FCVBscK711YvDS+DTKtHm394AFeVycOZT+HmBwdyUl9/bsM
	y+LWymDp5FGVLbBF7hQ1qv8fXQ==
X-Google-Smtp-Source: AMsMyM5HYNnkqQFryIhusPOXnsW0KKQfhvLYBxoxwi2MA6hkWp7FXfscczo+CSe0KbEGeI/30Dqumg==
X-Received: by 2002:a05:620a:40c6:b0:6bb:3d30:735 with SMTP id g6-20020a05620a40c600b006bb3d300735mr1394165qko.653.1663270635403;
        Thu, 15 Sep 2022 12:37:15 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id r1-20020ae9d601000000b006b872b606b1sm4596459qkk.128.2022.09.15.12.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 12:37:15 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>,
	stable@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 1/2] riscv: Make VM_WRITE imply VM_READ
Date: Thu, 15 Sep 2022 15:37:01 -0400
Message-Id: <20220915193702.2201018-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915193702.2201018-1-abrestic@rivosinc.com>
References: <20220915193702.2201018-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_123717_605841_E2C8B11F 
X-CRM114-Status: GOOD (  10.58  )
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

RISC-V does not presently have write-only mappings as that PTE bit pattern
is considered reserved in the privileged spec, so allow handling of read
faults in VMAs that have VM_WRITE without VM_READ in order to be consistent
with other architectures that have similar limitations.

Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
Cc: <stable@vger.kernel.org> # v4.19+
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
new in v3
v3 -> v4: add Fixes tag
---
 arch/riscv/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index f2fbd1400b7c..d86f7cebd4a7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -184,7 +184,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 		}
 		break;
 	case EXC_LOAD_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_READ)) {
+		/* Write implies read */
+		if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
 			return true;
 		}
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
