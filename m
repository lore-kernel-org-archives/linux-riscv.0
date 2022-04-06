Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z0XVUeGvbNlGf5oCqf20qYd1QnU71LPWCzL4RrJ2Svo=; b=tdnY4tvAa2kuvn
	SXmoueHZJm+tUH7JK/KgrQPdm6fNRM9UznpeeWp22QovQzt+3Y0hXo7nP6ziosBsM4yZH+eroEUDK
	foEQbATAWqmX620u+he6ia3f6Mn4j8oWn4RggTjV9IGMI4M3zdjWfDfNhQh7srZSeNiJaYSCbkND0
	mcARgxzs1W8ZUKMK+YciLz3zJYtqft/MXTDo4HL/SwzfXFxcd8F0UwSKO41fww51zWmtWpvOFLHWt
	Svl3ueUzvod73WgO1Ep5HlLeVKKexnpnQOgUh1jGRdNzNQwgDWSxmPkl1Sdw3Ya+He7vX2MReDS2M
	2AIE89Umk66j0nXAUHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6cQ-006V1K-TU; Wed, 06 Apr 2022 14:26:46 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6cO-006Uzw-NG
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 14:26:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so2834841pjy.5
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfj1GIB+si6iET8SbCUdgiY5TZkavgwCt42bdaZqDa8=;
 b=Vvm9hL/jx899S3DqVkPLQ4gKE9BtEMVtFydVbiu7k76eQunfKC3BHg1hFdx4qg1i+e
 DjUhoSjNNE92WqiwQUNMiQEratkmQr+MsduISz4ZLfGVnZkCVbaWoD+zlLsaY7dNrilj
 aUwctTARoNBM21LjlWHKUpoD5td8acnO3XNg36vQbjhMP7wYlQDhqUuKIs5tmXd9HDHu
 k2/TGe7SPoBLkU+ISiVwk0QbnxlDY6o72IjLqzih2XLGLp/uKF3nWrBo4sOv/zEdAI0S
 RoiHTeF+wHxvshyAo9XN4B3gbG6GWGQBMfPZQhrRGOKeqFTOO1GXbTMb+9N/FHmUrdSr
 tX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfj1GIB+si6iET8SbCUdgiY5TZkavgwCt42bdaZqDa8=;
 b=2cyd8l1LGi8x7tOi2Yc6wwH/7kyu8Cm73U1UEw4I/FX89Cot8BKH0MzCF7e16e2TdB
 y0+UlPrLuOGuc4dJxy1q949avDGr99GdJzP9Z4H0IT9LXFQpXTMPFuszHPFBD0JzOEil
 N9kN1h/3As74Wc88fPdKiAz21vyWFAyG0ECS5iENnalenjH1H49Qj+1dZpXM3laztat5
 ywDQcsvkIi7DiFwyNICf2WdA7pETZLGndZNRunN7jojSU5aaS2XjxfSB4Imr2KDvaqPS
 mi6Gqhcfrj9ohVXa6sW0xBo1NotIxIw0wu0NlrZVNyUt11tIcpQebSq50geEvClNwYYP
 9U+g==
X-Gm-Message-State: AOAM531RVKiTzfzv3wYQYZIqOkhyjBiEVqB8wuckysTYAi4sXJyzcjk/
 7MSvnO1+jsGaMSAVMKhbbFD0aw==
X-Google-Smtp-Source: ABdhPJw/oS8u3VzD9ycSvMGnTyIHEMUViuTNCy58B7lrkCZJ5lDsvskJD9wu0X6ITQ01e5SSTXqfBQ==
X-Received: by 2002:a17:902:b694:b0:153:1d9a:11a5 with SMTP id
 c20-20020a170902b69400b001531d9a11a5mr8919433pls.151.1649255202175; 
 Wed, 06 Apr 2022 07:26:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k137-20020a633d8f000000b0039800918b00sm16424151pga.77.2022.04.06.07.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 07:26:40 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 Eric Lin <eric.lin@sifive.com>
Subject: [PATCH 0/1] perf jitdump: Add riscv64 support
Date: Wed,  6 Apr 2022 22:26:05 +0800
Message-Id: <20220406142606.18464-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_072644_829305_F265C6DA 
X-CRM114-Status: UNSURE (   6.27  )
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

This patch enable perf jitdump for riscv64 and it tested with v8 on qemu rv64.

Qemu rv64:
# perf record -e cpu-clock -c 1000 -g -k mono ./d8_rv64 --perf-prof --no-wr
ite-protect-code-memory test.js
# perf inject -j -i perf.data -o perf.data.jitted
# perf report -i perf.data.jitted

Output:
# To display the perf.data header info, please use --header/--header-only option
s.
#
#
# Total Lost Samples: 0
#
# Samples: 87K of event 'cpu-clock'
# Event count (approx.): 87974000
#
# Children      Self  Command          Shared Object                Symbol

....
     0.28%     0.06%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal6WasmJs7InstallEPNS0_7IsolateEb
     0.28%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal10ParserBaseINS0_6ParserEE22ParseLogicalExpressionEv
     0.28%     0.03%  d8_rv64          jitted-112-76.so             [.] Builtin:
InterpreterEntryTrampoline
     0.12%     0.00%  d8_rv64          d8_rv64                      [.] _ZN2v88i
nternal19ContextDeserializer11DeserializeEPNS0_7IsolateENS0_6HandleINS0_13JSGlob
alProxyEEENS_33DeserializeInternalFieldsCallbackE
     0.12%     0.01%  d8_rv64          jitted-112-651.so            [.] Builtin:
CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit
....

Eric Lin (1):
  perf jitdump: Add riscv64 support.

 tools/perf/arch/riscv/Makefile | 1 +
 tools/perf/util/genelf.h       | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
