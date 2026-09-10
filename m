Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF085C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o43QvTW0VTJ03zWgE1QbBtUAv9EDJLMEltSTRHM0HF8=; b=m84yHby/so6NAK
	T//jW9CunPKzuPsTvKMnAP93FPx2KioZhkQOdrP4H8cqu8XcsgzHseL+01a/D+Mc4FEgF0de7//re
	Op2iB/FiSTK10aAyteblYScj8/wEGya78PLghLIy09rDX8TqBBwmsaQs/ApY09OJKjsoR8etyRj/H
	wCwJv2l3V2j6nVjXTBtugGqQpasz9v9VEiS5b4jhQ7cKC2KrWoJiGr2feMH/USEuTXZkRa7l/UX9y
	aXzRZ4HpXTQZ6FutVdv0Lfhb+Xt64FO5dyH6A+6Epmuo6N+E11Ys2nQFPZWHbEXBwtnxTwkLbCxZ8
	Q4rkPlhZGjglL6nBDlvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g3t-0000000Efir-0LzN;
	Thu, 10 Sep 2026 14:47:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g3s-0000000Efia-125A
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=; b=M2peWH9D1LvpF8kuKUlvdHPskX
	Cctebe2ugotDTHZlevYv51vzQD2Nr0tiloxTxfbKbgj252hTT3456M3IDMNt/qcU4dteecwBN7pV9
	euwP+7Qtnrrme9irVuXmLnRCSkbI/bytzKEhFqO9vOLzOyjFhg6wRiRAVvtMQiUHoi1/K8qBNF+lL
	s2iY+DY/ASSY9/mHqO/UnHUg55OsynZFM8KYb5skvEY4wnh4YWyACjLMTiA6de3W0zm5HakmG5Vs7
	Ubnn1Op6OaNJThVIhb/7PwMbIhVPSUggahL8g7sXgVKb/MHgZhY33eFvOe0sZhB4BhIrn3c5lfS22
	5qA6Mz9Q==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4g3o-00000002dSG-2zvT
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 14:47:35 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1239421f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 07:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051651; cv=none;
        d=google.com; s=arc-20260327;
        b=IUUzhFkY+TUGFU6+j5ENheLTqxMw1Xwbb4u1pW54nfiLFAHRB53rLI6TiM7hEQR0w+
         foD9BLK9CqqM4OSIy2RHkjWSTv5qt9NRmhWHQG7aFMaFs8NH2vJlWgtbWbGUEALC+Bbk
         FcTXfCAFkJBgF/4bpT5L6xsKgEd4Lrf4oA5I/YUozi1GzxKNv3AdXThPZa4LdDCNkCuf
         ttaj2xvW+gNO3AZpXoxkvpFVUNuWqk/tV5m5Hhl+dE81mzyoMDVxwz+6kb+9Km1MjijY
         cIDgsWEKYZOXgxA/DEeXQfZpCg62FZQu4D9gbGn/fDhG/fjCU7vHCUlXYnCxPNR8lEZe
         hFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        fh=NLXuTYPGjEI0mxP0LTOG6AehEjzuX45KXjYNrhJY1T4=;
        b=bse7q4Yud4cFmkUzU48jFEltstcpws/s9KeyD7UWPVmRK54pLIHuLIMTfEfcBSr2io
         pceszc1kWlOypFr8OBM2X9mLdRWm16UZLJ2u9B8kECbtKRrbc85Kv7h4BO+YuNkM6Isn
         6td9vMLjrO7VjqkVlffcbBKumYVEG9KoS3uJDcWyxyWOvww2x+REPiWKn1O/y3YgKiVN
         ec54a5KZDHA2CitWP0q4sjrt3ZT4T0Gr+Skq9/aCYJDRR//s+cxLMeIkN3KhwBXXz1IV
         ckvgejTxIWIy6Ly07dzCevyFCxN6MD0PmrsJiGK7Irn7xwnfybIVLrPAPHGp5Mt8hGBh
         5Oww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789051651; x=1789656451; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        b=oiZe2k7Au4JXjgPOanYtZgjOEPuOUun3MA0ZbTmHfnFjK2dyrdcEiPiSPEdS+KTCyX
         nXv3718J1RGGxFlHXOnAxCJMUNpbOIfj3/6YE1bHB6CcX6Gz8CPm9k3khelhEaBSwvhb
         Fsb6GN44YyxKqqhGyLDoSrAxe4Ji42UAbzH28V/kOCm65C7Y+A1CBukaazTVHaor+pfp
         AsuIbaQdu+5Qz5H4lfXE/wcdvxeF0giGIezQnvw2e/nDwPBvDbGEuz3CibZnmXHOi0U7
         iadZ+uG2WwQvkMhChj0FTY3N4tOMtY3tZwPiHsMpEFZ1E+6k8YUl4yE7HyvxWxnvr7L3
         F3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051651; x=1789656451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        b=grx7pWfdU9m6f5MXeV0f7QTR/OwkmnoTeXH9d1/fzaj31iV+VA4nHdMgkM+y2K/5ZZ
         X/fEAlnDUr57GdSXDG3AX5fspkjRaH+nsBxCL+jUvH2ZXVUlGcRZqTadMNFLb4somW9i
         0Y41tFT9lv08BTdE7d3XugjYL10r9+J7BnMTHmmeeObj8Tb+BDRUY1bd/KBPj03f6Sl1
         iuIM1mtFIwIY/lKbBYl0Ag9a87XY8hh+VWxB6qFPOZDuBsdH+5feTtw2DYUji1hrLA3S
         UwFQ80deKTcg5fJanwZsqISO8oQd3Ex5Cp8MOttVeVQhausqBQx1gjMXLIU4YT5TD1e+
         ZSrg==
X-Forwarded-Encrypted: i=1; AKwUvBx1NxfWD7pLsRrzRHLmsMVHMQFtXaI+hfRu8byujH7r5wxU4ghqyyc8bueB8Vfr4bw2DyzXw2SsiWillw==@lists.infradead.org
X-Gm-Message-State: AFuF++lAGA7H6lV2XyZTeoWUPIjSQhOB4cZVNBuZeisIX1z4/L2nRmwS
	RWcZDWBLlytZo7iPVRoKFv8eWrtSXIChlhhA8gASPpJGVXmq5UJ8jhIq9yqxOsKcYaFVwYDXZlW
	Kx8DLPti3lLBapt0X66gxZMO6ri7L9JNYLrkUWLxVCA==
X-Gm-Gg: AYBFou0e8RInxwtaRGQo1lzIHn0aI6M6kwQ4G1I0sCLru5VDwhSa0izpnlDa7NfaIAM
	o1OIhiAjg2D8RG1tg5bAspt8sYtFyccZ8KrI9Zft4sxH26xjby0uKCQofO83p5qMG9qpg9r9r5O
	4IV4AWgcpj75s/b10ysmStOkN19x0boIhhe3AehJAR716JNxptMmFKB3WJgx5N1kQ/OLofxLoOl
	sD5iXzC8g3rCITdu9SXm8M77sZN5v50ZOqMnY3opvzQlBHICMSNmwQAjHzUs0W2YCanUg8vEZTq
	9zInsaawjjaCc+9t+ONvzovyWMBkecVBE22zni1xgTwPWXo4EWLacwVn3eIkxbdhjhU9EsWOO0n
	o+s+KfZvekA9wjg/S0OQ8n5xnjWWE+nOyYt4RANoM4c7MBHLqPXRgpwCV06p8BaRVwQ741ot+yq
	U=
X-Received: by 2002:a05:6000:4801:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-485ba5ac39bmr18503655f8f.4.1789051650755; Thu, 10 Sep 2026
 07:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260826075009.68952-1-min_halo@163.com>
In-Reply-To: <20260826075009.68952-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 20:17:18 +0530
X-Gm-Features: AcwNN1XuamBEFO0Lo4789f27od5JxTL3ZDB6v9YGVoHyrw05uNbK6gYYJBs_SaA
Message-ID: <CAAhSdy3dymMWApBRrSw4YveTC8we8d2QaQ_3MHM0rp=BeP+AZg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix NACL hfence entry update order
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154732_869018_F0A29927 
X-CRM114-Status: GOOD (  22.23  )
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

T24gV2VkLCBBdWcgMjYsIDIwMjYgYXQgMToyMOKAr1BNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiBUaGUgU0JJIHYzLjAgc3BlY2lmaWNhdGlvbiAoc2VjdGlvbiAxNS4xLjIpIHJl
cXVpcmVzIGEgbmVzdGVkIEhGRU5DRQo+IGVudHJ5IHRvIGJlIHBvcHVsYXRlZCBhcyBmb2xsb3dz
Ogo+IDEpIGZpbmQgYW4gdW51c2VkIGVudHJ5IHdpdGggQ29uZmlnLlBlbmRpbmcgPT0gMAo+IDIp
IHVwZGF0ZSB0aGUgUGFnZV9OdW1iZXIgYW5kIFBhZ2VfQ291bnQgd29yZHMKPiAzKSB1cGRhdGUg
dGhlIENvbmZpZyB3b3JkIHdpdGggQ29uZmlnLlBlbmRpbmcgc2V0Cj4KPiBfX2t2bV9yaXNjdl9u
YWNsX2hmZW5jZSgpIHdyaXRlcyB0aGUgQ29uZmlnIHdvcmQgZmlyc3QsIHNvIHRoZSBTQkkKPiBp
bXBsZW1lbnRhdGlvbiAob3IgTkFDTCBoYXJkd2FyZSkgY2FuIG9ic2VydmUgYSBwZW5kaW5nIGVu
dHJ5IHdpdGgKPiBwbnVtL3Bjb3VudCB2YWx1ZXMgbGVmdCBvdmVyIGZyb20gdGhlIHByZXZpb3Vz
IHVzZSBvZiB0aGF0IGVudHJ5LAo+IHJlc3VsdGluZyBpbiBpbmNvcnJlY3QgVExCIGZsdXNoIHJh
bmdlcy4KPgo+IFdyaXRlIHBudW0gYW5kIHBjb3VudCBmaXJzdCBhbmQgdGhlIENvbmZpZyB3b3Jk
IGxhc3QuIFNpbmNlIHRoZQo+IGNvbnN1bWVyIGlzIGFuIGV4dGVybmFsIGFnZW50IG9uIGNvaGVy
ZW50IHNoYXJlZCBtZW1vcnksIHVzZQo+IFdSSVRFX09OQ0UoKSB0byBzdG9wIHRoZSBjb21waWxl
ciBmcm9tIHJlb3JkZXJpbmcgdGhlIHN0b3JlcyBhbmQKPiBzbXBfd21iKCkgdG8gbWFrZSB0aGUg
cGFyYW1ldGVyIHdvcmRzIGdsb2JhbGx5IHZpc2libGUgYmVmb3JlIHRoZQo+IFBlbmRpbmcgYml0
IGlzIHNldC4KPgo+IEZpeGVzOiBkNDY2YzE5Y2VhZDUgKCJSSVNDLVY6IEtWTTogQWRkIGNvbW1v
biBuZXN0ZWQgYWNjZWxlcmF0aW9uIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IFpvbmdtaW4g
WmhvdSA8emhvdXpvbmdtaW5Aa3lsaW5vcy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeCBmb3Ig
TGludXgtNy4zLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9uYWNs
LmMgfCAyMCArKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9u
YWNsLmMgYi9hcmNoL3Jpc2N2L2t2bS9uYWNsLmMKPiBpbmRleCA5YWZmMDNjNGY2NjcuLmE1Y2Rh
OWE2NTE1NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9uYWNsLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS9uYWNsLmMKPiBAQCAtNDIsMTIgKzQyLDI0IEBAIHZvaWQgX19rdm1fcmlzY3Zf
bmFjbF9oZmVuY2Uodm9pZCAqc2htZW0sCj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0K
Pgo+IC0gICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNFX0VOVFJZX0NP
TkZJRyhpKTsKPiAtICAgICAgICplbnRwID0gY3B1X3RvX2xlbG9uZyhjb250cm9sKTsKPiArICAg
ICAgIC8qCj4gKyAgICAgICAgKiBQZXIgU0JJIHYzLjAgc2VjdGlvbiAxNS4xLjIsIHRoZSBQYWdl
X051bWJlciBhbmQgUGFnZV9Db3VudAo+ICsgICAgICAgICogd29yZHMgbXVzdCBiZSB1cGRhdGVk
IGJlZm9yZSB0aGUgQ29uZmlnIHdvcmQgd2l0aCBpdHMgUGVuZGluZwo+ICsgICAgICAgICogYml0
IHNldC4gV1JJVEVfT05DRSgpIHN0b3BzIHRoZSBjb21waWxlciBmcm9tIHJlb3JkZXJpbmcgdGhl
Cj4gKyAgICAgICAgKiBzdG9yZXMgYW5kIHNtcF93bWIoKSBtYWtlcyB0aGUgcGFyYW1ldGVyIHdv
cmRzIGdsb2JhbGx5Cj4gKyAgICAgICAgKiB2aXNpYmxlIHRvIHRoZSBTQkkgaW1wbGVtZW50YXRp
b24gKG9yIE5BQ0wgaGFyZHdhcmUpIGJlZm9yZQo+ICsgICAgICAgICogdGhlIFBlbmRpbmcgYml0
IGlzIHNldC4KPiArICAgICAgICAqLwo+ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xf
U0hNRU1fSEZFTkNFX0VOVFJZX1BOVU0oaSk7Cj4gLSAgICAgICAqZW50cCA9IGNwdV90b19sZWxv
bmcocGFnZV9udW0pOwo+ICsgICAgICAgV1JJVEVfT05DRSgqZW50cCwgY3B1X3RvX2xlbG9uZyhw
YWdlX251bSkpOwo+ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNF
X0VOVFJZX1BDT1VOVChpKTsKPiAtICAgICAgICplbnRwID0gY3B1X3RvX2xlbG9uZyhwYWdlX2Nv
dW50KTsKPiArICAgICAgIFdSSVRFX09OQ0UoKmVudHAsIGNwdV90b19sZWxvbmcocGFnZV9jb3Vu
dCkpOwo+ICsKPiArICAgICAgIC8qIEVuc3VyZSB0aGUgcGFyYW1ldGVyIHdvcmRzIGFyZSB2aXNp
YmxlIGJlZm9yZSB0aGUgUGVuZGluZyBiaXQgKi8KPiArICAgICAgIHNtcF93bWIoKTsKPiArCj4g
KyAgICAgICBlbnRwID0gc2htZW0gKyBTQklfTkFDTF9TSE1FTV9IRkVOQ0VfRU5UUllfQ09ORklH
KGkpOwo+ICsgICAgICAgV1JJVEVfT05DRSgqZW50cCwgY3B1X3RvX2xlbG9uZyhjb250cm9sKSk7
Cj4gIH0KPgo+ICBpbnQga3ZtX3Jpc2N2X25hY2xfZW5hYmxlKHZvaWQpCj4gLS0KPiAyLjM0LjEK
Pgo+Cj4gTm8gdmlydXMgZm91bmQKPiAgICAgICAgICAgICAgICAgQ2hlY2tlZCBieSBIaWxsc3Rv
bmUgTmV0d29yayBBbnRpVmlydXMKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
