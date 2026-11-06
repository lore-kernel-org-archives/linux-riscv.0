Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C074606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GojdnomB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K6bjgxh+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D84NOGH2;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6D93ECe;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D84NOGH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7O8yShBTt/ZCGSpm3nuBQ44A/pkV9+/+Td8G3M0sW6k=; b=GojdnomBPmbetLICHusUXeLW5p
	rdTZRaXqgLjYpeduZnHJeO7/xXB1WenScYO+kISeHhj4neTPf2QPBz4SaUCpINdaI5qLPde60MsuJ
	03DMpIE8c+mhztMIIafuSUNuMvP4cN66yknE+WcshTskT0XZ88sAuHHnpAYEKYLS0/ykmoGJ8HJqG
	QLtmIs5r3zL6sf8zH81x4jKtiA3RZlLxqJd4OU+eON5XyESYxH5X8UQ/ItqZG4ckbjeyYN9DtFS8e
	MxzREjTWI8K+DrzpQov9HPU8F41+rwA+PzF+j2jvaVrfALYuWEV99LZg/gEA9jBtCfTnIR7REaTps
	jB1xda1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLsd-0000000CpFj-0WkZ;
	Fri, 06 Nov 2026 15:29:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLsb-0000000CpF3-1Xoz
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Nov 2026 15:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SXTDpANQfd3kZ4iyt5aU2EufJ6zQmbyiUMbk4M9TUUs=; b=K6bjgxh+SYQICd0/fJ3mJywngw
	qG1zo6DQq6SRdWYqAUuolnBlnO8SLWmMFirc0TRL2PhbQ5ZDNfdRze5MOVKAbA9H6dlRi2gXduXRn
	7FWRBvj2kREcwXHrVeo28P4/sNITYDuNKyxQ9C+EX9dckY5KNG9TGo/gG2b6MRTOxKei/bZeW4LIe
	/4AMEq8GZ4UO9HyrzEYSM+rw7PStARf20Kvob3r8ylgzSFLDhk0mu0cOH/h5O/KHau1EShEkQNLxA
	kw+rS5B+r5WaNNJbOwFsYRvPuu9dt+gx5FwuZsaeshiYPckWCThyQ8Pk6RVyydhiGeQpgHzPOA/ud
	boldtCjw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLsY-00000004P5h-1PQ5
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 15:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793978952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXTDpANQfd3kZ4iyt5aU2EufJ6zQmbyiUMbk4M9TUUs=;
	b=D84NOGH2tC7U6QWturiuPYrMoEWEMQXCELoXBNAynovJCUath6tUJjswYO53uZPhwmQhhr
	lrKVg4dR5JdSGvL34vvjAzfxD0mXiJ8nYMPYiLS1TGsPTHwADdZmXT9YPvNkAOKM6hioUX
	rtjZuOOnt/VK1L2eG50VcQJDwU08wQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793978960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXTDpANQfd3kZ4iyt5aU2EufJ6zQmbyiUMbk4M9TUUs=;
	b=Q6D93ECeX6DqVEDD2pGUT+Eejq+4EdHtd3KmzkvqMAgN9Tn5umeYSAndaW+wZUpxoAnmy8
	lg1eie8FCUrNI2YKJXox+MVkH16wJiurySKycGsL2cEZtb4rXB/tAgk1MapC1umkl1Dj01
	tJwHH875cv6Wgkac2bfCc0TQc67Ep9c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793978952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXTDpANQfd3kZ4iyt5aU2EufJ6zQmbyiUMbk4M9TUUs=;
	b=D84NOGH2tC7U6QWturiuPYrMoEWEMQXCELoXBNAynovJCUath6tUJjswYO53uZPhwmQhhr
	lrKVg4dR5JdSGvL34vvjAzfxD0mXiJ8nYMPYiLS1TGsPTHwADdZmXT9YPvNkAOKM6hioUX
	rtjZuOOnt/VK1L2eG50VcQJDwU08wQA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-F_BvQzqWNyuMtpgz4PDnew-1; Fri, 06 Nov 2026 10:29:11 -0500
X-MC-Unique: F_BvQzqWNyuMtpgz4PDnew-1
X-Mimecast-MFC-AGG-ID: F_BvQzqWNyuMtpgz4PDnew_1793978950
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a77c1cbd15so7897375e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 07:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978950; x=1794583750;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmTzqQweiyKU6xuO3QveE/+1/71DKsDi9B9HZdawRTQ=;
        b=QdEoBQrul1W/0CJHI+fBMeOoxhviEzX9fETYFmnIuF7ITgwTRAsBpaBlp1UqaoxfWq
         em7F2OIBOGau/Qg0dwfQqr6qeT01XwkY3TKv57/9HV20EI/TmkXQrAkKjUoxyrwo4Ytk
         dW/o9eRmYSB3QsbSLOQrKhb49GMpA7zUwjifXL7vnY+lEvEggOV57m/oFuuoUgAFnEtG
         PifxDOeguufdn0tIPSE0mdK680wMikXBM3eDFq1+PVLi5g3G9fuk2Ol7O6TDslSCx/GX
         Vad/X06174WzUZdFzqJA6s8Ct0YhWImtbSaSsToFQltOoqkEeBSDgdTht2l+Uh1Jii+o
         fhNw==
X-Forwarded-Encrypted: i=1; AKwUvBzDA8ANppEcOxQrt0E1zJXumH5HCxuoxUGRlijJkwhsrAoasbsslJ+LHXj3TPlwWyYDRmW8zzfDQW8Vww==@lists.infradead.org
X-Gm-Message-State: APuU4Z/NXcIkgDsWuVxZi7ISjoOSpRWvj2ievbkZOckvD+leeyq9sdoS
	FdpRKC/GQjMmSvcW4LduXzCUssamf/2xxGxHxc06N1qDOnm2MjHiFs+Kf6Y76CA9J42q4Ost6En
	DzNpWqv8cTP2CZyCAYD3xmg0yvfvEMDiPOXnR6LSQ0UyQL2bXVvPC8NSXwo3bHSVdnMEq0CqaJL
	kajiYfUNTxsfOBB7t3z86iC37EztDlpRl5RYebMwn1HAeP3Ik6G4S20g==
X-Gm-Gg: AYBFou2QkSyeqy/5v3QX6wugaeafeCi1OsTyknCAxmNRqQrwxnpdmxqhOZW0XiE2k8Q
	75mjNpMOEINt6iJUdz2Sjt9c6Q6LWhv5yCmBySyH84Htqe/+C5Jul+zo/H3D1z22u1C5KS1PXHi
	liFuaC+5UtFZ5oNKJ922Ghp6XA0PYhPys+graBt0wl04pY0gVMST72OPp+HcVcX7x2Bfrdzdtet
	i1cfGjgcDUc7ipq5VyvPkGxAYgWv+CPfGJhqdVGUnn/IdUNVV2sDeIx4re38lB8AMVx2Ba3mylX
	u7GlVUq3HzY84TPtvXwCn4CM6+4tnH+AeAYtiaRU7dHx4iAbmkA2u2lctCAU5woE/DiYyc1E0il
	hwqusVgnp2XAsh9KKZpyg+kGIkCrS/iybqjSY9ESeSmnxNP0jIZfshBZGMVkcEg/Owfuq14kvjp
	QJTaDUXawzicLHTUYrqeJNdz+Y+IEO3w3m3w==
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr50782055e9.11.1793978949723;
        Fri, 06 Nov 2026 07:29:09 -0800 (PST)
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr50781475e9.11.1793978949328;
        Fri, 06 Nov 2026 07:29:09 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm127063625e9.4.2026.11.06.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:29:08 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de,
 mingo@redhat.com, oliver.yang@linux.alibaba.com, peterz@infradead.org,
 rostedt@goodmis.org, tianruidong@linux.alibaba.com,
 vincent.guittot@linaro.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
In-Reply-To: <20260821171127.1061494-1-cmirabil@redhat.com>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <xhsmhecjg38no.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20260821171127.1061494-1-cmirabil@redhat.com>
Date: Fri, 06 Nov 2026 16:29:07 +0100
Message-ID: <xhsmh1p8you64.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EKwGxvWOEAbawuGVBM6uH51k7mnmwUqyFC6AIi91VBM_1793978950
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_152922_393474_F2C534E8 
X-CRM114-Status: GOOD (  17.56  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjEvMDgvMjYgMTM6MTEsIENoYXJsZXMgTWlyYWJpbGUgd3JvdGU6Cj4gSGkgUnVpZG9uZywg
VmFsZW50aW4sICgrIGNvcHlpbmcgaW4gUklTQy1WIGxpc3QvbWFpbnRhaW5lcnMp4oCUCj4KPiBP
biBUdWUsIE1heSAxMiwgMjAyNiBhdCAwNjoxNjo0M1BNICswMjAwLCBWYWxlbnRpbiBTY2huZWlk
ZXIgd3JvdGU6Cj4+IE9uIDA5LzA1LzI2IDExOjUwLCBSdWlkb25nIFRpYW4gd3JvdGU6Cj4+ID4g
dGFza19zdHJ1Y3Qga2VlcHMgZ3Jvd2luZyBvdmVyIHRpbWUuICBPbiBhcmNoaXRlY3R1cmVzIHRo
YXQgY29tcHV0ZSB0aGUKPj4gPiBwZXItdGFzayBzdGFjayBjYW5hcnkgb2Zmc2V0IGZyb20gYXNt
LW9mZnNldHMuaCBhbmQgcGFzcyBpdCB0byB0aGUKPj4gPiBjb21waWxlciB2aWEgLW1zdGFjay1w
cm90ZWN0b3ItZ3VhcmQtb2Zmc2V0PSwgdGhpcyBncm93dGggZXZlbnR1YWxseQo+PiA+IHB1c2hl
cyBzdGFja19jYW5hcnkgYmV5b25kIHdoYXQgdGhlIHRhcmdldCBJU0EgY2FuIGVuY29kZS4KPj4g
Pgo+PiA+IE9uIFJJU0MtViwgY2FuYXJ5IGxvYWRzIGFyZSBlbWl0dGVkIGFzCj4+ID4KPj4gPiAg
ICAgbGQJdDAsIFRTS19TVEFDS19DQU5BUlkodHApCj4+ID4KPj4gPiB3aGVyZSBUU0tfU1RBQ0tf
Q0FOQVJZIG11c3QgZml0IGludG8gYSAxMi1iaXQgc2lnbmVkIGltbWVkaWF0ZSwgaS5lLgo+PiA+
IFstMjA0OCwgMjA0N10uICBPbmNlIHN0YWNrX2NhbmFyeSBzaXRzIHBhc3QgYnl0ZSAyMDQ3IG9m
IHRhc2tfc3RydWN0LAo+PiA+IHRoZSBidWlsZCBmYWlscyB3aXRoCj4+ID4KPj4gPiAgICAgY2Mx
OiBlcnJvcjogJzxOPicgaXMgbm90IGEgdmFsaWQgb2Zmc2V0IGluCj4+ID4gICAgICAgICAnLW1z
dGFjay1wcm90ZWN0b3ItZ3VhcmQtb2Zmc2V0PScKPgo+IFRoYW5rcyBmb3IgdGhpcyBwYXRjaC4g
V2UganVzdCByYW4gaW50byB0aGlzIGV4YWN0IGlzc3VlIGR1cmluZyBhIENLSSBidWlsZAo+IGh0
dHBzOi8vZGF0YXdhcmVob3VzZS5ja2ktcHJvamVjdC5vcmcva2NpZGIvYnVpbGRzLzE2Mzk3ODIg
YW5kIHRoaXMgc2VlbXMKPiBsaWtlIGV4YWN0bHkgdGhlIGZpeCB3ZSBuZWVkLgo+CgpJJ3ZlIGFs
c28gYmVlbiBwaW5nZWQgYWJvdXQgdGhpcyBleGFjdCBmYWlsdXJlOwoKUGV0ZXIsIEluZ28sIGRv
IHlvdSB0aGluayB5b3UgY291bGQgdGFrZSB0aGlzPwpJIGNvdWxkbid0IGZpbmQgYW55dGhpbmcg
YmV0dGVyIHRoYW4gdG8gYWRkIGEgTFVJIGluc3RydWN0aW9uIHRvIHN0cmV0Y2gKdGhlIGltbWVk
aWF0ZSBiZXlvbmQgMmssIHdoaWNoIGlzIGEgYml0IHdhc3RlZnVsLiBUaGlzIGxvb2tzIG9rYXkg
Zm9yIG5vdywKdW50aWwgc29tZW9uZSBzbWFydGVyIGNhbiBjb21lIHdpdGggYSByaXNjLXYgc3Bl
Y2lmaWMgaW1wcm92ZW1lbnQgKG9yIHRoZQphcmNoaXRlY3R1cmUgZ3Jvd3Mgc2NhbGVkIGltbWVk
aWF0ZSBvZmZzZXRzKS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
