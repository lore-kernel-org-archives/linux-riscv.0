Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAF8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0DNwok545KFqJuo7Ojurq0utqR9gX5gGtNL1FZ/gJDM=; b=H7ypkLLHFUgxD9
	Xon9D2sPnZfRnxgwbphadKw+Mu0rC6z68zkrzcdUd09EkgX/NUaEBj+RxAt+HdXFCoAkt5tfUkZOQ
	hszNDyUMTIUTCRjf6BlTswOmIBIhZhXnjwnF5lIwlM8euJS/IPXT19hGRceXlO1uL3LwOWA20uOB4
	7njI3bDqnm6r8F+8CqYgqBx9KjN2bPpjPuwVu4E/TiPuaIpy0TrQgQGHQmA5PrhcYFQpfzt2wRr1w
	XyPl0BsYwSYLKlcYPuPPtzQA/x0PHo8BwUkI5BGfA9A+9GmU+1rEABxC746R+cSu/VpNcTIN2195q
	MbVTxeGulbvCJH8OJNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntbwg-009DVF-MM; Tue, 24 May 2022 21:20:02 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntbwd-009DUA-E6
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 21:20:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id j21so17102850pga.13
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 14:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AOOnQwX8FlMZPsRjdPt59x3rx2ygNvknjVlpR0iASV4=;
 b=YrTSwufLEZ1P7/fW0b/k6bLAK/RaBs/rYT5zdNK+AgXQ3AfBxedshAwy/hCIaDeMum
 63fAA5CXnCSlev0yz8w5zJhf+Gl71NBw+ln88+tJe9F2OdZrlckhk6isvq37z+mtIAoB
 GUUiprEZGCRYxZ3TKbhuCuaR+TCfnqGX+28hhCbYWCcA6wXWnx6tF0Ds0/yuAfu93c0U
 q9DKy/Dv2xD/oY1wOHTn8NdmF8uUp1br3r5riHE3BXs4JB+s8yMumemO0L0OoONBZGZk
 tiXTLgZUthwGvfGbljEKg/3YXIK/Tdn9WwXImLUgH03uoTJYhEk7NjuNRtYWoQCs8KrE
 rvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AOOnQwX8FlMZPsRjdPt59x3rx2ygNvknjVlpR0iASV4=;
 b=W2qcvKWQe98B5kcQFw9DkGRaKsDQWBer+uyabn9dqG8iBfNWabaBcGo6CKc4OPEr06
 ce8/bcN08835BythYDXZiq/0YBz0QFMGENqSQNu/KcDX2y2zgdTUePRVbxN1d2yoogrL
 ojx2AiSQKl7VQmMZF/xh+/yuC22G1i9vds9+QOLDLItY2AtxQa9mrGC/ut7s3cqE+TR9
 s8YYlzPJF8VuSTx6pHnfNs00JKBK9JDzn2xsJexwNKHhQiHFVTUioCWrZnMtNnZsUq/r
 2W7kSB8LXbiPA/Lce+fl3xyuw7OyM7XHXa6ZqkH92rnKaJ6C3wGrDX5/MMc7Wec7+jsT
 uGeg==
X-Gm-Message-State: AOAM533qiLe7N9JMzFKdpSgT4DiALowydenPW0B5GfYW26iLfie9NxXE
 LoHlPN2dXVBKHVaK4qg02iIPTA==
X-Google-Smtp-Source: ABdhPJxSAPU1ORTbLoGjyN5yxspHkTvKVWS0vgFiLp2ZZwtBNnGRSmXsVQw8Qg6e72inntA8VWn4fQ==
X-Received: by 2002:a05:6a00:170c:b0:510:865f:bf34 with SMTP id
 h12-20020a056a00170c00b00510865fbf34mr30397811pfc.60.1653427197677; 
 Tue, 24 May 2022 14:19:57 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a62d404000000b0050dc7628181sm9833817pfh.91.2022.05.24.14.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 14:19:57 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Tsukasa OI <research_trasio@irq.a4lg.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH v2] arch/riscv: add Zihintpause support
Date: Tue, 24 May 2022 14:19:50 -0700
Message-Id: <20220524211954.1936117-1-daolu@rivosinc.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_141959_733724_FB9D1872 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SW1wbGVtZW50IHN1cHBvcnQgZm9yIHRoZSBaaUhpbnRQYXVzZSBleHRlbnNpb24uCgpUaGUgUEFV
U0UgaW5zdHJ1Y3Rpb24gaXMgYSBISU5UIHRoYXQgaW5kaWNhdGVzIHRoZSBjdXJyZW50IGhhcnTi
gJlzIHJhdGUgb2YKaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudCBzaG91bGQgYmUgdGVtcG9yYXJpbHkg
cmVkdWNlZCBvciBwYXVzZWQuCgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4KVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgpTaWdu
ZWQtb2ZmLWJ5OiBEYW8gTHUgPGRhb2x1QHJpdm9zaW5jLmNvbT4KLS0tCgp2MSAtPiB2MjoKIFJl
bW92ZSB0aGUgdXNhZ2Ugb2Ygc3RhdGljIGJyYW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBz
dXBwb3J0cyBpdAoKIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8IDQg
KysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgIHwgMSArCiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggfCA4ICsrKysrKystCiBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHUuYyAgICAgICAgICAgICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyAgICAgICAgICB8IDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUg
Yi9hcmNoL3Jpc2N2L01ha2VmaWxlCmluZGV4IDdkODExMDJjZmZkNC4uOTAwYThmZGExYTJkIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUK
QEAgLTU2LDYgKzU2LDEwIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX1JJU0NWX0lTQV9DKQk6PSAk
KHJpc2N2LW1hcmNoLXkpYwogdG9vbGNoYWluLW5lZWQtemljc3ItemlmZW5jZWkgOj0gJChjYWxs
IGNjLW9wdGlvbi15biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemljc3JfemlmZW5jZWkpCiBy
aXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2VpKSA6PSAkKHJpc2N2LW1h
cmNoLXkpX3ppY3NyX3ppZmVuY2VpCiAKKyMgQ2hlY2sgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0
cyBaaWhpbnRwYXVzZSBleHRlbnNpb24KK3Rvb2xjaGFpbi1zdXBwb3J0cy16aWhpbnRwYXVzZSA6
PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1tYXJjaC15KV96aWhpbnRwYXVz
ZSkKK3Jpc2N2LW1hcmNoLSQodG9vbGNoYWluLXN1cHBvcnRzLXppaGludHBhdXNlKSA6PSAkKHJp
c2N2LW1hcmNoLXkpX3ppaGludHBhdXNlCisKIEtCVUlMRF9DRkxBR1MgKz0gLW1hcmNoPSQoc3Vi
c3QgZmQsLCQocmlzY3YtbWFyY2gteSkpCiBLQlVJTERfQUZMQUdTICs9IC1tYXJjaD0kKHJpc2N2
LW1hcmNoLXkpCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAwNzM0ZTQyZjc0ZjIuLmNhYTll
ZTU0NTliNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNTIsNiArNTIsNyBAQCBleHRlcm4g
dW5zaWduZWQgbG9uZyBlbGZfaHdjYXA7CiAgKi8KIGVudW0gcmlzY3ZfaXNhX2V4dF9pZCB7CiAJ
UklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiA9IFJJU0NWX0lTQV9FWFRfQkFTRSwKKwlSSVNDVl9JU0Ff
RVhUX1pJSElOVFBBVVNFLAogCVJJU0NWX0lTQV9FWFRfSURfTUFYID0gUklTQ1ZfSVNBX0VYVF9N
QVgsCiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKaW5kZXggMTM0
Mzg4Y2JhYWExLi40ZGU5MTFhMjUwNTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmRzby9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJv
Y2Vzc29yLmgKQEAgLTgsNyArOCwxMyBAQAogCiBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3JlbGF4
KHZvaWQpCiB7Ci0jaWZkZWYgX19yaXNjdl9tdWxkaXYKKyNpZmRlZiBfX3Jpc2N2X3ppaGludHBh
dXNlCisJLyoKKwkgKiBSZWR1Y2UgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudC4KKwkgKiBUaGlzIGFz
c3VtZXMgdGhlIFBDIGNoYW5nZXMuCisJICovCisJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJwYXVz
ZSIpOworI2VsaWYgX19yaXNjdl9tdWxkaXYKIAlpbnQgZHVtbXk7CiAJLyogSW4gbGlldSBvZiBh
IGhhbHQgaW5zdHJ1Y3Rpb24sIGluZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4gKi8KIAlfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
LmMKaW5kZXggY2NiNjE3NzkxZTU2Li44OWU1NjNlOWM0Y2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCkBAIC04OCw2ICs4
OCw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSkKICAqLwogc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNhX2V4dF9hcnJbXSA9
IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBN
RiksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklI
SU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKCIiLCBSSVNDVl9JU0FfRVhUX01BWCks
CiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggMWIyZDQyZDdmNTg5Li4zN2ZmMDY2ODJh
ZTYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTI1LDYgKzI1LDcgQEAgc3RhdGljIERFQ0xB
UkVfQklUTUFQKHJpc2N2X2lzYSwgUklTQ1ZfSVNBX0VYVF9NQVgpIF9fcmVhZF9tb3N0bHk7CiBf
X3JvX2FmdGVyX2luaXQgREVGSU5FX1NUQVRJQ19LRVlfRkFMU0UoY3B1X2h3Y2FwX2ZwdSk7CiAj
ZW5kaWYKIAorCiAvKioKICAqIHJpc2N2X2lzYV9leHRlbnNpb25fYmFzZSgpIC0gR2V0IGJhc2Ug
ZXh0ZW5zaW9uIHdvcmQKICAqCkBAIC0xOTIsNiArMTkzLDcgQEAgdm9pZCBfX2luaXQgcmlzY3Zf
ZmlsbF9od2NhcCh2b2lkKQogCQkJCXNldF9iaXQoKmV4dCAtICdhJywgdGhpc19pc2EpOwogCQkJ
fSBlbHNlIHsKIAkJCQlTRVRfSVNBX0VYVF9NQVAoInNzY29mcG1mIiwgUklTQ1ZfSVNBX0VYVF9T
U0NPRlBNRik7CisJCQkJU0VUX0lTQV9FWFRfTUFQKCJ6aWhpbnRwYXVzZSIsIFJJU0NWX0lTQV9F
WFRfWklISU5UUEFVU0UpOwogCQkJfQogI3VuZGVmIFNFVF9JU0FfRVhUX01BUAogCQl9Ci0tIAoy
LjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
