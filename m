Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380FBC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnZBip91mXJg1+i5svkHI/z3UzknGGvVDNTFlh+klsw=; b=UtJezrCUmoaDX2
	paHb2uQsMTK8b2Pc+mkzuyzyj8PJKt5pwC2aDmey6nnx7QK5WnBVwOs+XtiNP3b9452dZbN1dDAlY
	yeWUJIZx/ap6btC74HvArz7uw1b1tcyS7T+ySdRlbUTLeu/TXMQspPsLyVN2GmpZLjuZy4WD9ugOe
	AvsNIxIGQZNXB5VWBJCzlkT0ggek2ZJ+osLLs9oZJrTz7u9VxEghtSuUN3IJJU85Npre7qPsuLU7L
	/wfs6JN47HfPzbn69+svY6ov0xCfE269SMAdEwS3MXJwTp/3ywiKz1PvJYsSAQTlkflPHPP736WkM
	iAlG94/AgKvIFpRFvO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6qd-00000008Vg0-2oKe;
	Wed, 29 Jul 2026 16:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6qc-00000008Vex-0UMk
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Jul 2026 16:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=; b=Q8kiRZFrBBoqKh0+oK5FFLMONP
	qpq/hA8HczJLmY/j1ibjNJYcbotC6mPDtRgFtZrUNXKy6jVKlf2NsR1YEaRuz+ZQS/kfNC7uo126w
	LOQ6Iaw+li+p1ZtyWFiI+t+okL4+xOW+qruMlxm2ELvR4aMyee7aVzo+U8tKq8CBBHA3jAEotPMB4
	/kagUbYI43oYfnswTX62JORZ4ocy1qbj6jbk+FH+jdzlUoq/06NCM78l95o26+J9MrzEaMped0KLX
	0W3cQZNa9XkDL3AIez4Tjt159bVSrBKV2JL3pe/pixbnlKqABBAWYiSLNMBdw+x5wVeSwEpyf3T9W
	6f3Mrn/g==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp6qX-00000005zU3-43ME
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:09:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso792405f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341368; cv=none;
        d=google.com; s=arc-20260327;
        b=OP+NdcPC3Fk7sgkJbVpcATzPCi0Ydgdw04tRF+UMrpnqYIAylc5OzUDEZa/rEb0EuF
         TyrzcDi5FbL+PMc4bj30YaJuXpJTavhY8GYp13QIGW+HOBWZtUDmTVT32NQlBq1sVhrv
         /0k08BLJBI/rixTXZZ/WrfC0witWEUkmQIFiZoHD5YcIlmPja3z8l4JCdOKREwVZ2sE4
         9upCmLY4LifIxUI+YBK2sQy4dkRpGUG73Xc+Z7V2yi2VQ3d46qjoiF9tlQUjsTWo8TQj
         JjhL117a0YD6QbFTspPBgX/5uH9OGggaEgW/gUwuJGUI02ftybC+qiwxBPhZWg6X8xmF
         ziTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        fh=Pchb2RK4EGjThgldigTOQiiNMKLnEFOEdH10JJN+zy4=;
        b=PkTlxlCqIoyiikq77pbVr1y2M5YTdoaa/bbjkZ2wLNlCgT4DWhqKyw67tITKMwJti3
         kdpJp/sms0FTUr0lbTdrVW95iYKppK0HC0csBJKzNCQwM5QjoqT2nmbFi8FxwX4GBZ5A
         MzQXHcwa3HaNwoxDa/OjXVzTMw/of4VMi+Cpd4UFp9LUf/d5GkwkyctBgfPablyahVFG
         hQmUL2S0dhrldbyRglAdhv3W1jummAPojccIanyS52GjFrRgD3Xc3+Ik2EOJASy9ms2D
         siu5kaWxknj74XAzeimTbgxZft457WGKzjqj0Fq7axvzXgJ/xySRlL5eeMUovp4DOL+c
         ZVVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785341368; x=1785946168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        b=esKqA4H3vi38ve5xWUWNaGxy6gdsPykLkSEbTC/Og/wfXgo11aSNvpRDIleCjvfzTr
         ZxNPn9Nmigx7Jb1bU/XCgqnC/+syxIA7RckkfjHPk9I2mRMcH2ILcmngplOIOzpvR3PO
         +hkzxDHHIG5yEQHqXXcHQNS8FrPhKhe0+4HNsjeR8qMrScoT1BaWNLRE6ArzMqcsMpYu
         V00DrJsyrbdLoNGwPJU2JJBkhc8MJW+Kc/A+peFXwVcOVmCcGjZ8IwN60Bxl191uTUGp
         FqhBfrR+yluEinyMNhZX2FRzgrtSJh57lQ6ENmuVGd8t1QKCPMhNpnANrall6xr8TW7F
         t92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341368; x=1785946168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        b=RDZqNjsxTOL/DwZntQKIzHsJSgGL1NeuvlnZLb6NuDChwvTbwzNVqD28F56FZzhd2n
         Hyt/DFzLq/YfDZ8sLgMdAfVc9/9bqtZf+DrC3o6hjc8krPtUeKXjW8eT/oFRc9Mk5pLT
         QH4FAtflbitmAV2zSFAhdGlaCo7Pq91z1jjYxbSWyNKuBgJN9aJsaCWqhIHAvN2ITCKP
         cwVgAjn4dSXmMWhbvL5029THauTy+OY8/UhqPURgWCkanqlx6xAcQVmuId4ym2fKNIIt
         Uyy8hcBzf/Hww47d16yqzXdjqQmSh9ohb9LCHdrIAYsl8ct9BuJohY4dTlO99on8k2as
         QTgg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb5HMiXDs6nDR5fSX4EqCQHdk0kVbCrQ+qcHYnbdIg5B4SoJNDkogwv/K0AG+JrXC+QRpdEneLaXutjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2PRCGdDW9nBnGn3/oSaKs7ig4Eumin+Ql3zg0aHYOGRWjPcwP
	RdKzS6EfYErL8WjcYY6T3IVY6q8quHO7DeYGkqNRQhfwgNehlzS+ahfHFupsg4em8JoGMxAbOsw
	Id4YXcUk1ETrhS9DcBi2yPx0IORBjl2/N/hIjbaSejQ==
X-Gm-Gg: AR+sD11pC52r1gC3k/YlTk+Yi6CXm75Uw4CeJNy1iczB5lzvIXcA5fKvgNJneqHFCNB
	dE2myOI/FDT1gxgt2VYgnT8ht8geYEpGmavAi9fy/W0Y66qIAd98Fw7uGJfzeRUY4DIfkqUs2o1
	Ysb8T+T+fX89nnJdcA46OgBMcJmv9rgfwPiTyox2n1gLeAKcW0NBaxFNnrn4wgV/xaAPIx69UHk
	UJ1o3AYZ+4uhrxJlOWZ4kfdRE++GK2fQZbVRzLM8y3YlQOd4kvMFVkvnw15xDuryfXRA/I42v/7
	suiRlo/4kP2r5edcwO/xP+OUpo/JgYFUN5FvNG7qN11VFoK2PYNpMLrKvCOoqWvdOmiFcyr3Bht
	MsQLq6t3/Vd0ggZC0fqdGWKaxumEu4FfswhG6omxUVcovmKbIeNRX0kTBox2kMPNO
X-Received: by 2002:a05:6000:230c:b0:475:f100:3607 with SMTP id
 ffacd0b85a97d-47fb1ee72ccmr9567614f8f.54.1785341367986; Wed, 29 Jul 2026
 09:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-3-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-3-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:39:16 +0530
X-Gm-Features: AUfX_my5C6bC1gg8YQo_QEqDM5Cr5_eRkLpJTSlYIaDahaeJGjleoyTTh0Bt330
Message-ID: <CAAhSdy0Bn3N+weuszLa3VX6rJHRoXRSwqEf3MZEoSJXy6=cwxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: KVM: Use unsigned int for vma_pageshift
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_170930_097699_2AB52A59 
X-CRM114-Status: GOOD (  13.95  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiB2bWFfcGFnZXNoaWZ0IGluIGt2bV9yaXNjdl9tbXVfbWFw
KCkgd2FzIGRlY2xhcmVkIHNob3J0LiAgVXNlIHVuc2lnbmVkCj4gaW50LCB0aGUgY29udmVudGlv
bmFsIGtlcm5lbCB0eXBlIGZvciBiaXQgd2lkdGhzIGFuZCBzaGlmdCBjb3VudHMsIGluCj4gcHJl
cGFyYXRpb24gZm9yIHNoYXJpbmcgYSBjb21tb24gc3RydWN0IGt2bV9wYWdlX2ZhdWx0IGFjcm9z
cwo+IGFyY2hpdGVjdHVyZXMuICBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IEFzc2lzdGVkLWJ5
OiBZdWFuU2hlbmc6IGRlZXBzZWVrLXY0LXBybwo+IENvLWRldmVsb3BlZC1ieTogUXVhbiBaaG91
IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3Vx
dWFuQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IEJpbmd5dSBYaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA5NDNkOGRjNzIxMDUuLmQy
YTA2YTU0YmUxNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTU0MSw3ICs1NDEsNyBAQCBpbnQga3ZtX3Jpc2N2X21t
dV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1z
bG90LAo+ICAgICAgICAga3ZtX3Bmbl90IGhmbjsKPiAgICAgICAgIGJvb2wgaXNfaHVnZXRsYjsK
PiAgICAgICAgIGJvb2wgd3JpdGFibGU7Cj4gLSAgICAgICBzaG9ydCB2bWFfcGFnZXNoaWZ0Owo+
ICsgICAgICAgdW5zaWduZWQgaW50IHZtYV9wYWdlc2hpZnQ7Cj4gICAgICAgICBnZm5fdCBnZm4g
PSBncGEgPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
Owo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwo+IC0tCj4gMi41NC4wCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
