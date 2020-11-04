Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E221C4741F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100BF20732
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 19:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZWy8vY2e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPpnG9Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100BF20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wt0amw+HYjYMz7LtQUKdwuiF7R5tFWj7pewjMxUPqy0=; b=ZWy8vY2egg3CJzbB8YqEVHzBFT
	wNzM86rxihRu/9dOe/Ag3dbvvXJ+vF0viBuGWkKF8e+0RVhKY308YCm/UTV6VmTkeK1qECYn3cIc/
	3acJkZrsYzLJU7kWM372JlmyQE1DwPAWvfwbH/MHMuO1FR9SGV6UcTvQRWjYT144YrPzfwG9jY8Wy
	SXB7dI4oWBGG88ImQtoOJ9uCwrmNeCHf6yr0AUlVxXuvJwzQr+2nL7jCcUyAeRwBItOYqLhqe3H0P
	Ed9Zwd9aTvhQD8s2Hhj2zLI4aCrjDezPHEEVKJvtS8UZ3iMrrr56YG0O+1ihL+XQfzBeD2ucEso8b
	NBMBqlBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaOZi-0001ME-Uc; Wed, 04 Nov 2020 19:36:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaOZd-0001IN-AR
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 19:36:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id p22so3512488wmg.3
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxJovM8uDqxzTsn9dVqfv0BrrWZVdtSmY0ZF8ZUveX8=;
 b=tPpnG9Xq0fL6ljrah9eqo6gIO+7EFirJIIvgiced9ycP88Q8KlHpshTpZKcvgizvJN
 DqVDEBLns8yBcUkmpYWgGUSuOeuHwc3TbeagV22ul0tUT7FGEaANe6mr2M3zH1Ec6Z05
 dCH6ia3+OS223SMvWzLLHuXpDFCNLMIVdigWev4DmGI1eXmNginogEzXPeMA79X1yVLV
 0qxxtJRnjyHJLEc/h2eBmqyGiNydmzfE3+aZSxanbJKMIY8u2keejYT051xW+oj82BfS
 wy+JhFXK6BjGfUjjwLP8W/PJD/RldyJXs3gJlou3nOdWUM0pUSiSA9aD3ga+L1YtZxim
 i6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jxJovM8uDqxzTsn9dVqfv0BrrWZVdtSmY0ZF8ZUveX8=;
 b=QkyxW/nmoqG8Od90Od+vry2nY+FwImqWB+rot08XYeqZvBYijPgJlvtKZ8nBATBjB1
 Se02iMQntydjBTD8ZOiSGn8zpw12aJUVAWgd9yB4EUNFgt6E2zoS0fpkeN2gKQrf4Sjr
 9j8WLBJ+gOFA7dEvXO93Wk+EgwN5Fqoh5iRyJqzm6b23ZWSzimn8UyarmcoSGAgyCMXN
 le6ZYC8cPt2ZM2neSg6shrPOyrP/cizJ2CNXAvobK45zumIMKjVp0ZFVx2eFzWmYOlXR
 54wSPAO7v8vTZT6MW1dHVvBaarmQ9SZOOVAPDaS56l9TYeNo6TjuRxkOmBc5ippth5PS
 g0Fg==
X-Gm-Message-State: AOAM533Bub0TTtyQvk76qXcu92KyNEHjekwvQ1onSdRh0mNj7npKriuL
 HUUpCES6LaXeMVCuhpUh8+9qVA==
X-Google-Smtp-Source: ABdhPJwDg2lxqbHlNGOB+b3ejFgNnWIzk2D54Jbj3ObyHrWkPcl/d3c3TSyNOcinZAfD1+eqPp2ICw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr6283218wmh.98.1604518554550; 
 Wed, 04 Nov 2020 11:35:54 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:35:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/36] Rid W=1 issues from TTY
Date: Wed,  4 Nov 2020 19:35:13 +0000
Message-Id: <20201104193549.4026187-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_143601_473383_A1BF77B6 
X-CRM114-Status: GOOD (  15.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Robert Love <rlove@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nick Holloway <alfie@dcs.warwick.ac.uk>, Russ Gorby <russ.gorby@intel.com>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 -- <julian@uhunix.uhcc.hawaii.edu>, Andrew Morton <andrewm@uow.edu.eu>,
 Laxman Dewangan <ldewangan@nvidia.com>, Paul Mackerras <paulus@samba.org>,
 "David A. Hinds" <dahinds@users.sourceforge.net>,
 linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Bill Hawes <whawes@star.net>,
 Roland Stigge <stigge@antcom.de>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jan Dumon <j.dumon@option.com>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Marko Kohtala <Marko.Kohtala@hut.fi>, linux-media@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linaro-mm-sig@lists.linaro.org,
 Stanislav Voronyi <stas@cnti.uanet.kharkov.ua>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Andrew J. Kroll" <ag784@freenet.buffalo.edu>,
 processes-Sapan Bhatia <sapan@corewars.org>, Kevin Wells <kevin.wells@nxp.com>,
 Miloslav Trmac <mitr@redhat.com>, Mike Hudson <Exoray@isys.ca>,
 Joseph Barrow <d.barow@option.com>, linux-kernel@vger.kernel.org,
 paulkf@microgate.com, Filip Aben <f.aben@option.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Jelinek <jj@ultra.linux.cz>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCkxlZSBKb25lcyAoMzYpOgogIHR0
eTogc2VyZGV2OiBjb3JlOiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICdkdW1teScKICB0dHk6IHNl
cmRldjogY29yZTogUHJvdmlkZSBtaXNzaW5nIGRlc2NyaXB0aW9uIGZvciAnb3duZXInCiAgdHR5
OiB0dHlfYmF1ZHJhdGU6IEFkZCBtaXNzaW5nIGRlc2NyaXB0aW9uIGZvciAndHR5JwogIHR0eTog
dHR5X2lvOiBNb3ZlICd0dHlfc3lzY3RsX2luaXQncyBwcm90b3R5cGUgdG8gc2hhcmVkIHNwYWNl
CiAgdHR5OiB0dHlfYnVmZmVyOiBBZGQgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgJ2xpbWl0Jwog
IHR0eTogdHR5X3BvcnQ6IERlbW90ZSBvYnZpb3VzIGFidXNlIG9mIGtlcm5lbC1kb2MgZm9ybWF0
dGluZwogIHR0eTogdHR5X2pvYmN0cmw6IEFkZCBtaXNzaW5nIGZ1bmN0aW9uIHBhcmFtZXRlciBk
ZXNjcmlwdGlvbnMKICB0dHk6IHR0eV9sZGlzYzogRml4IHNvbWUga2VybmVsLWRvYyByZWxhdGVk
IG1pc2RlbWVhbm91cnMKICB0dHk6IHZ0OiBjb25zb2xlbWFwOiBEZW1vdGUgd2Vha2x5IGRvY3Vt
ZW50ZWQgZnVuY3Rpb24gaGVhZGVyCiAgdHR5OiBuX3R0eTogQWRkIDIgbWlzc2luZyBwYXJhbWV0
ZXIgZGVzY3JpcHRpb25zCiAgdHR5OiBzZXJpYWw6IGpzbToganNtX2NsczogUmVtb3ZlIHVudXNl
ZCB2YXJpYWJsZSAnZGlzY2FyZCcKICB0dHk6IHR0eV9pbzogRml4IHNvbWUga2VybmVsLWRvYyBp
c3N1ZXMKICB0dHk6IHNlcmlhbDogODI1MDogODI1MF9wb3J0OiBTdGF0aWNpZnkgZnVuY3Rpb25z
IHJlZmVyZW5jZWQgYnkKICAgIHBvaW50ZXJzCiAgdHR5OiBzZXJpYWw6IDgyNTA6IHNlcmlhbF9j
czogUmVtb3ZlIHVudXNlZC91bmNoZWNrZWQgdmFyaWFibGUgJ2VycicKICB0dHk6IHR0eV9hdWRp
dDogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVycwogIHR0eTogcHR5OiBQ
cm92aWRlIGRlc2NyaXB0aW9ucyBmb3IgdGhlICdmaWxlJyBwYXJhbWV0ZXJzCiAgdHR5OiBzZXJp
YWw6IGFtYmEtcGwwMTE6IE1hcmsgJ3Nic2FfdWFydF9hY3BpX21hdGNoJyBhcyBfX21heWJlX3Vu
dXNlZAogIHR0eTogbl9nc206IERlbW90ZSBvYnZpb3VzIGFidXNlIG9mIGtlcm5lbC1kb2MgYW5k
IHN1cHBseSBvdGhlcgogICAgbWlzc2luZyBkb2NzcwogIHR0eTogc2VyaWFsOiBscGMzMnh4X2hz
OiBSZW1vdmUgdW51c2VkIHZhcmlhYmxlICd0bXAnCiAgdHR5OiBzZXJpYWw6IG1zbV9zZXJpYWw6
IFJlbW92ZSBzZXQgYnV0IHVudXNlZCB2YXJpYWJsZSAnc3RhdHVzJwogIHR0eTogc2VyaWFsOiBp
Zng2eDYwOiBGaXggZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBoZWFkZXJzCiAgdHR5OiBzZXJpYWw6
IHhpbGlueF91YXJ0cHM6IFN1cHBseSBkZXNjcmlwdGlvbiBmb3IgbWlzc2luZyBtZW1iZXIKICAg
ICdjdHNfb3ZlcnJpZGUnCiAgdHR5OiBzeW5jbGlua19ndDogRGVtb3RlIG9uZSBrZXJuZWwtZG9j
IGhlYWRlciBhbmQgcmVwYWlyIGFub3RoZXIKICB0dHk6IHNlcmlhbDogc2VyaWFsLXRlZ3JhOiBT
dHJ1Y3QgaGVhZGVycyBzaG91bGQgc3RhcnQgd2l0aCAnc3RydWN0CiAgICA8bmFtZT4nCiAgdHR5
OiBzZXJpYWw6IHNpZml2ZTogU3RydWN0IGhlYWRlcnMgc2hvdWxkIHN0YXJ0IHdpdGggJ3N0cnVj
dCA8bmFtZT4nCiAgdHR5OiBzeW5jbGlua21wOiBBZGQgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3Ig
ZnVuY3Rpb24gcGFyYW0gJ3R4cXVldWUnCiAgdHR5OiBzeW5jbGlua21wOiBNYXJrIG5ldmVyIGNo
ZWNrZWQgJ3JlYWR2YWwnIGFzIF9fYWx3YXlzX3VudXNlZAogIHR0eTogc2VyaWFsOiBzdG0zMi11
c2FydDogUmVtb3ZlIHNldCBidXQgdW51c2VkICdjb29raWUnIHZhcmlhYmxlcwogIHR0eTogdHR5
X2xkaXNjOiBTdXBwbHkgbWlzc2luZyBkZXNjcmlwdGlvbiBmb3IgJ3R0eV9sZGlzY19nZXQncyAn
dHR5JwogICAgcGFyYW0KICB0dHk6IHNlcmlhbDogc2VyaWFsLXRlZ3JhOiBQcm92aWRlIHNvbWUg
bWlzc2luZyBzdHJ1Y3QgbWVtYmVyCiAgICBkZXNjcmlwdGlvbnMKICBwb3dlcnBjOiBhc206IGh2
Y29uc29sZTogTW92ZSAnaHZjX3Zpb19pbml0X2Vhcmx5J3MgcHJvdG90eXBlIHRvCiAgICBzaGFy
ZWQgbG9jYXRpb24KICB0dHk6IGh2YzogaHZjX3ZpbzogU3RhdGljaWZ5IGZ1bmN0aW9uIGludm9r
ZWQgb25seSBieSByZWZlcmVuY2UKICB0dHk6IGh2YzogaHZjX29wYWw6IFN0YXRpY2lmeSBmdW5j
dGlvbiBpbnZva2VkIGJ5IHJlZmVyZW5jZQogIHR0eTogc2VyaWFsOiBwbWFjX3ppbG9nOiBNYWtl
IGRpc3Bvc2FibGUgdmFyaWFibGUgX19hbHdheXNfdW51c2VkCiAgdHR5OiBzeW5jbGluazogTWFy
ayBkaXNwb3NhYmxlIHZhcmlhYmxlcyBhcyBfX2Fsd2F5c191bnVzZWQKICB0dHk6IHN5bmNsaW5r
OiBQcm92aWRlIG1pc3NpbmcgZGVzY3JpcHRpb24gZm9yICdoZGxjZGV2X3R4X3RpbWVvdXQncwog
ICAgJ3R4cXVldWUnIHBhcmFtCgogYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h2Y29uc29sZS5o
ICAgICB8ICAzICsrKwogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BzZXJpZXMuaCB8
ICAzIC0tLQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3NldHVwLmMgICB8ICAxICsK
IGRyaXZlcnMvdHR5L2h2Yy9odmNfb3BhbC5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy90dHkvaHZjL2h2Y192aW8uYyAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3R0eS9u
X2dzbS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrLQogZHJpdmVycy90dHkvbl90dHku
YyAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBkcml2ZXJzL3R0eS9wdHkuYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKysKIGRyaXZlcnMvdHR5L3NlcmRldi9jb3JlLmMgICAgICAg
ICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfcG9ydC5j
ICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC9zZXJpYWxfY3MuYyAgICAg
IHwgIDkgKysrLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYW1iYS1wbDAxMS5jICAgICAgICAg
IHwgIDIgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC9pZng2eDYwLmMgICAgICAgICAgICAgfCAgMyAr
Ky0KIGRyaXZlcnMvdHR5L3NlcmlhbC9qc20vanNtX2Nscy5jICAgICAgICAgfCAgNCArLS0tCiBk
cml2ZXJzL3R0eS9zZXJpYWwvbHBjMzJ4eF9ocy5jICAgICAgICAgIHwgIDMgKy0tCiBkcml2ZXJz
L3R0eS9zZXJpYWwvbXNtX3NlcmlhbC5jICAgICAgICAgIHwgIDMgKy0tCiBkcml2ZXJzL3R0eS9z
ZXJpYWwvcG1hY196aWxvZy5oICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC9z
ZXJpYWwtdGVncmEuYyAgICAgICAgfCAgNyArKysrKystCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2lm
aXZlLmMgICAgICAgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNh
cnQuYyAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwveGlsaW54X3VhcnRw
cy5jICAgICAgIHwgIDEgKwogZHJpdmVycy90dHkvc3luY2xpbmsuYyAgICAgICAgICAgICAgICAg
ICB8ICA1ICsrKy0tCiBkcml2ZXJzL3R0eS9zeW5jbGlua19ndC5jICAgICAgICAgICAgICAgIHwg
IDMgKystCiBkcml2ZXJzL3R0eS9zeW5jbGlua21wLmMgICAgICAgICAgICAgICAgIHwgIDMgKyst
CiBkcml2ZXJzL3R0eS90dHlfYXVkaXQuYyAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0t
LS0tCiBkcml2ZXJzL3R0eS90dHlfYmF1ZHJhdGUuYyAgICAgICAgICAgICAgIHwgIDEgKwogZHJp
dmVycy90dHkvdHR5X2J1ZmZlci5jICAgICAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvdHR5
L3R0eV9pby5jICAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KIGRyaXZlcnMv
dHR5L3R0eV9qb2JjdHJsLmMgICAgICAgICAgICAgICAgfCAgMyArKysKIGRyaXZlcnMvdHR5L3R0
eV9sZGlzYy5jICAgICAgICAgICAgICAgICAgfCAxMSArKysrKystLS0tLQogZHJpdmVycy90dHkv
dHR5X3BvcnQuYyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvdHR5L3Z0L2Nv
bnNvbGVtYXAuYyAgICAgICAgICAgICAgfCAgMyArLS0KIGluY2x1ZGUvbGludXgvdHR5LmggICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiAzMyBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25z
KCspLCA1OCBkZWxldGlvbnMoLSkKCkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9y
Z3VlQHN0LmNvbT4KQ2M6ICJBbmRyZXcgSi4gS3JvbGwiIDxhZzc4NEBmcmVlbmV0LmJ1ZmZhbG8u
ZWR1PgpDYzogQW5kcmV3IE1vcnRvbiA8YW5kcmV3bUB1b3cuZWR1LmV1PgpDYzogQW5keSBHcm9z
cyA8YWdyb3NzQGtlcm5lbC5vcmc+CkNjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtl
cm5lbC5jcmFzaGluZy5vcmc+CkNjOiBCaWxsIEhhd2VzIDx3aGF3ZXNAc3Rhci5uZXQ+CkNjOiBC
am9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBDb2xpbiBJYW4gS2luZyA8
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpDYzogIkMuIFNjb3R0IEFuYW5pYW4iIDxjYW5hbmlh
bkBhbHVtbmkucHJpbmNldG9uLmVkdT4KQ2M6ICJEYXZpZCBBLiBIaW5kcyIgPGRhaGluZHNAdXNl
cnMuc291cmNlZm9yZ2UubmV0PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogRmlsaXAgQWJlbiA8Zi5hYmVuQG9wdGlvbi5jb20+CkNjOiBHZXJhbGQgQmFlemEgPGdlcmFs
ZC5iYWV6YUBzdC5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPgpDYzogSmFrdWIgSmVsaW5layA8ampAdWx0cmEubGludXguY3o+CkNjOiBKYW4g
RHVtb24gPGouZHVtb25Ab3B0aW9uLmNvbT4KQ2M6IEppcmkgU2xhYnkgPGppcmlzbGFieUBrZXJu
ZWwub3JnPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6IEpv
c2VwaCBCYXJyb3cgPGQuYmFyb3dAb3B0aW9uLmNvbT4KQ2M6IC0tIDxqdWxpYW5AdWh1bml4LnVo
Y2MuaGF3YWlpLmVkdT4KQ2M6IEtldmluIFdlbGxzIDxrZXZpbi53ZWxsc0BueHAuY29tPgpDYzog
TGF4bWFuIERld2FuZ2FuIDxsZGV3YW5nYW5AbnZpZGlhLmNvbT4KQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5v
cmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNlcmlhbEB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZwpDYzogTWFya28gS29odGFsYSA8TWFy
a28uS29odGFsYUBodXQuZmk+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20+CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+CkNjOiBN
aWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPgpDYzogTWlrZSBIdWRzb24gPEV4
b3JheUBpc3lzLmNhPgpDYzogTWlsb3NsYXYgVHJtYWMgPG1pdHJAcmVkaGF0LmNvbT4KQ2M6IE5p
Y2sgSG9sbG93YXkgPGFsZmllQGRjcy53YXJ3aWNrLmFjLnVrPgpDYzogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckBkYWJiZWx0LmNvbT4KQ2M6IHBhdWxrZkBtaWNyb2dhdGUuY29tCkNjOiBQYXVsIE1h
Y2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
CkNjOiBwcm9jZXNzZXMtU2FwYW4gQmhhdGlhIDxzYXBhbkBjb3Jld2Fycy5vcmc+CkNjOiBSb2Jl
cnQgTG92ZSA8cmxvdmVAZ29vZ2xlLmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+CkNjOiBSb2xhbmQgU3RpZ2dlIDxzdGlnZ2VAYW50Y29tLmRlPgpDYzogUnVzc2VsbCBLaW5n
IDxsaW51eEBhcm1saW51eC5vcmcudWs+CkNjOiBSdXNzZWxsIEtpbmcgPHJta0Bhcm0ubGludXgu
b3JnLnVrPgpDYzogUnVzcyBHb3JieSA8cnVzcy5nb3JieUBpbnRlbC5jb20+CkNjOiBTdGFuaXNs
YXYgVm9yb255aSA8c3Rhc0BjbnRpLnVhbmV0LmtoYXJrb3YudWE+CkNjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogU3lsdmFpbiBMZW1pZXV4IDxzbGVtaWV1eC50
eWNvQGdtYWlsLmNvbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b20+CkNjOiBWbGFkaW1pciBaYXBvbHNraXkgPHZ6QG1sZWlhLmNvbT4KLS0gCjIuMjUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
