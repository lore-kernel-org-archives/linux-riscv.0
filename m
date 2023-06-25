Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22332EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 15:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEiOH9yqGeNTBJkU1AvZG1zwfTJwWRmEGnrOSoW4Lb0=; b=cscjbbC0DLh2nA
	0gRn+QYtXE+yJFcLs4vtMlXdfkBoRPalUT9wdbZNFhxF3xGuzIiIPNn3z6qqnhawJraHo8l1RDCAb
	uA5LOrgjwYitaJ9YqClaAsQZz6OsE9FsvdTiAZhoORrIC5OZIoZ9jQsrAS5WEHVXpwRE+2FPVquwm
	mZD7Fab/RBBXXqhvcJ64qBviBNwNfh8U/ffusCN819GitndFJ3Jq+jpBSY2z8eHl8N4heSKRACh4v
	3CxFnGwPgEosZ9XscSTHZcDoZHV41opRKtGCUNxagFZeSTbiLbaC8IBqKLPFfsMC3jHOak6OZxbhh
	OL/6PaIsGAC6CjxJgHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRMt-008Bj7-35;
	Sun, 25 Jun 2023 15:09:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRMr-008Bhw-1Y
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 15:09:34 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-543c692db30so2119444a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687705771; x=1690297771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVh54AiRY2maqm1BEPVTl5/CxTXjv6X2NhvFWQ0OjHo=;
        b=OeBpPFSU5Wd+JbWFjSswSCQXtUYVAO0lZDuCsi1G5knHa0bFyzGYkxEdqy8mbzb6p+
         rZUXm+fkrocHcXbxB/HNGZ/CjLJB1XfADG2DpgpGnpsx8s0JtdtLQnZvRuz+8coU/B0+
         d8HBqXguCt3GcopFRUAar84OzO4WdGkO3CkkdaRY0nDsusWEfSpcbNujtYHW6SdFneIH
         thKxYEkBvIC3B4xqJvVzT1vboI5gyEWRy2IuqIX8SMxQ909wSVkJLmXLkHtr8R6eLB0g
         pbmjwdQ+FvZqtEHDFK72blGPcnPyQe2MhOGVAvPLFxdnrIPP6H0hjKvjmDXb2DuPvifD
         tvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687705771; x=1690297771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVh54AiRY2maqm1BEPVTl5/CxTXjv6X2NhvFWQ0OjHo=;
        b=DYmWDLpYRbKvX/lnZMWgjqDqOCr3je2pGm1l+idhIFrQkZWYhBjWGA4/0USr9HPfMO
         fVweJiqCEfzuljisPCZTLvK2xylZT/za0chzFLaW9Q0VdyrQOsnYk0uozrLeG0wCTyx8
         xP+7AclwDtW97BziEO82LHqCdoSLUigrfdoOqMj4PptloOmBhMglILD9Ape3/soHzcUI
         o/rI6sHX7wfKKCEMrA7byyCdqAHcaQcfAf+ZB77cFkA1BNWt191j6Ih3gn8RLavTmok8
         DRysOf6sgIxlXsuR30vtTnNGeY2NPemYJyD6hy1v+IM9zZBw6b2JJHqsOFPRvPEjLkKQ
         8+nA==
X-Gm-Message-State: AC+VfDx6v1xONtQnHChYBz7SXrtMVWGhClQyj1D/yoAw1dq1b+QZpBmJ
	23sFqTZ8PVo7HqVK+fI6mN3B1+MSzsd+m9mk
X-Google-Smtp-Source: ACHHUZ4nWcnXGi3AXbtLp2opVZDYOjhgbrKiCWFd+K0O248eUCpZd8yRMmQ9rFFRQ+//TmTNItdgdA==
X-Received: by 2002:a17:902:a705:b0:1b1:a9e7:5d4b with SMTP id w5-20020a170902a70500b001b1a9e75d4bmr4933953plq.22.1687705770998;
        Sun, 25 Jun 2023 08:09:30 -0700 (PDT)
Received: from [0.0.0.0] ([5.180.77.117])
        by smtp.gmail.com with ESMTPSA id iz13-20020a170902ef8d00b001b7fe13c97csm686590plb.72.2023.06.25.08.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 08:09:30 -0700 (PDT)
Message-ID: <20281f01-2cc9-892e-beea-eb2bb91e3ca5@gmail.com>
Date: Sun, 25 Jun 2023 23:09:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
 alexghiti@rivosinc.com, mpe@ellerman.id.au, arnd@arndb.de, rppt@kernel.org,
 samuel@sholland.org, panqinglin2020@iscas.ac.cn, conor.dooley@microchip.com,
 anup@brainfault.org, xianting.tian@linux.alibaba.com,
 anshuman.khandual@arm.com, heiko@sntech.de, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
 <20230625140931.1266216-2-songshuaishuai@tinylab.org>
 <20230625-multiple-diaper-1db88a75314e@spud>
From: Song Shuai <suagrfillet@gmail.com>
In-Reply-To: <20230625-multiple-diaper-1db88a75314e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_080933_540510_A4C61805 
X-CRM114-Status: GOOD (  17.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ClNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXBseSwKTXkgdGlueWxhYiBlbWFpbCB3ZW50IHNvbWV0
aGluZyB3cm9uZywgSSdsbCB1c2UgZ21haWwgaW4gdGhpcyB0aHJlYWQuCgrlnKggMjAyMy82LzI1
IDIyOjE4LCBDb25vciBEb29sZXkg5YaZ6YGTOgo+IE9uIFN1biwgSnVuIDI1LCAyMDIzIGF0IDEw
OjA5OjI5UE0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6Cj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
ZWQzMDljZTUyMjE4NTU4M2IxNjNiZDBjNzRmMGQ5ZjI5OWZlMTgyNi4KPj4KPj4gV2l0aCB0aGUg
Y29tbWl0IDMzMzUwNjhmODcyMSAoInJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRo
ZQo+PiBsaW5lYXIgbWFwcGluZyIpIHJldmVydGVkLCB0aGUgTUlOX01FTUJMT0NLX0FERFIgcG9p
bnRzIHRoZSBrZXJuZWwKPj4gbG9hZCBhZGRyZXNzIHdoaWNoIHdhcyBwbGFjZWQgYXQgYSBQTUQg
Ym91bmRhcnkuCj4gCj4+IEFuZCBmaXJtd2FyZSBhbHdheXMKPj4gY29ycmVjdGx5IG1hcmsgcmVz
aWRlbnQgbWVtb3J5LCBvciBtZW1vcnkgcHJvdGVjdGVkIHdpdGggUE1QIGFzCj4+IHBlciB0aGUg
ZGV2aWNldHJlZSBzcGVjaWZpY2F0aW9uIGFuZC9vciB0aGUgVUVGSSBzcGVjaWZpY2F0aW9uLgo+
IAo+IEJ1dCB0aGlzIGlzIG5vdCB0cnVlPyBUaGUgdmVyc2lvbnMgb2YgT3BlblNCSSB0aGF0IHlv
dSBtZW50aW9uIGluIHlvdXIKPiBjb3ZlciBsZXR0ZXIgZG8gbm90IGRvIHRoaXMuCj4gUGxlYXNl
IGV4cGxhaW4uCj4gCgpBdCB0aGlzIHRpbWUsIE9wZW5TYmkgW3YwLjgsdjEuMykgYW5kIGVkazIo
UmlzY1ZWaXJ0KSBpbmRlZWQgZG9uJ3Qgb2JleSAKdGhlIERUL1VFRkkgc3BlYy4gVGhpcyBzdGF0
ZW1lbnQgaXMgZXhjZXJwdGVkIGZyb20gIlJlc2VydmVkIG1lbW9yeSBmb3IgCnJlc2lkZW50IGZp
cm13YXJlIiBwYXJ0IGZyb20gdGhlIHVwY29taW5nIHJpc2N2L2Jvb3QucnN0LiBJdCBpc24ndCAK
YWNjdXJhdGUgZm9yIG5vdy4gSG93IGFib3V0IGRlbGV0aW5nIHRoaXMgb25lPwoKQWN0dWFsbHkg
d2l0aCAzMzM1MDY4Zjg3MjEgcmV2ZXJ0ZWQsIHRoZSBjaGFuZ2Ugb2YgTUlOX01FTUJMT0NLX0FE
RFIgY2FuIAphdm9pZCB0aGUgbWFwcGluZyBvZiBmaXJtd2FyZSBtZW1vcnksIEkgd2lsbCBtYWtl
IGl0IGNsZWFyIGluIHRoZSBuZXh0IAp2ZXJzaW9uLgoKPj4gU28gdGhvc2UgcmVnaW9ucyB3aWxs
IG5vdCBiZSBtYXBwZWQgaW4gdGhlIGxpbmVhciBtYXBwaW5nIGFuZCB0aGV5Cj4+IGNhbiBiZSBz
YWZlbHkgc2F2ZWQvcmVzdG9yZWQgYnkgaGliZXJuYXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnPgo+PiAtLS0KPj4gICBhcmNo
L3Jpc2N2L0tjb25maWcgfCA1ICstLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmln
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IDU5NjZhZDk3YzMwYy4uMTdiNWZjN2Y1NGQ0
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4+IEBAIC04MDAsMTEgKzgwMCw4IEBAIG1lbnUgIlBvd2VyIG1hbmFnZW1lbnQgb3B0
aW9ucyIKPj4gICAKPj4gICBzb3VyY2UgImtlcm5lbC9wb3dlci9LY29uZmlnIgo+PiAgIAo+PiAt
IyBIaWJlcm5hdGlvbiBpcyBvbmx5IHBvc3NpYmxlIG9uIHN5c3RlbXMgd2hlcmUgdGhlIFNCSSBp
bXBsZW1lbnRhdGlvbiBoYXMKPj4gLSMgbWFya2VkIGl0cyByZXNlcnZlZCBtZW1vcnkgYXMgbm90
IGFjY2Vzc2libGUgZnJvbSwgb3IgZG9lcyBub3QgcnVuCj4+IC0jIGZyb20gdGhlIHNhbWUgbWVt
b3J5IGFzLCBMaW51eAo+PiAgIGNvbmZpZyBBUkNIX0hJQkVSTkFUSU9OX1BPU1NJQkxFCj4+IC0J
ZGVmX2Jvb2wgTk9OUE9SVEFCTEUKPj4gKwlkZWZfYm9vbCB5Cj4+ICAgCj4+ICAgY29uZmlnIEFS
Q0hfSElCRVJOQVRJT05fSEVBREVSCj4+ICAgCWRlZl9ib29sIEhJQkVSTkFUSU9OCj4+IC0tIAo+
PiAyLjIwLjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
