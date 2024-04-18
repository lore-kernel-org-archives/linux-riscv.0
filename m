Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64889C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5tbZo3RgYjr9HJag5YS40EEN1nKlFc2k5oj82Q+UVLw=; b=o8nL/5YJVzphUi
	VVHdVQHzbjSKAOfrzKujYntmu5EisuA+sd8MSbGarmv3VWB8EN8vSZOC5WxhaySXX9bvqz17+5i7n
	qXHb0OtsCMzQh39kAq9aFlsROaYnSZzCV7jqIyfAII5ZOPNvFo1yuzN8BEhDIln/dlT72KXSM2mPK
	ZIs0MOPB2lc7jvDKMB+UJ4Gftnn4wLal+fN5ACrGRLkQwgKbP8oV19LaSXzDHjx61TemxQwGmS76x
	yM8ngvrYslamyjtwLn9f1qfzp8wwzxrgk9aEtvkUtwY5UUc/GvUYJsZoUN4jnSfcnrgpbaHna6rBf
	FCYq5nr2zI/8GerYWHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxVq3-00000003Ew0-04qi;
	Thu, 18 Apr 2024 17:46:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUge-000000031Rd-04rn
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 16:32:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f074520c8cso1085056b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713457952; x=1714062752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qw41A+dZx7I8Diykai2FpeK5mNXOqfbEJEaS+qGnKM=;
        b=Mvm284FNP0l1tRhQOT8YXevJyEAjzgM5J9UV/9cgxCWJMzES7fuEga/5hnl1A+JAfK
         5O68wqgR6N+cGErjC1k5XSIIJLms9UVlOt7nbdtjCcbVnefosZLc94OotdrpcubWpIx8
         7lNMjgTbwR1F6Lp26sqC9ulZbU5VQGArHyjXtuFEIwYCXeQObAmGRrDs6xgPdG3wRKqn
         R05Jgl4qy74Ycb+ESL1sHHJcWzmXup6dR8sJt1X/xeoSH2qcJhFcV8h7qzLWTiu8LB2G
         3jLJEiYSZw7g6Pr/fgVNt1WGxFhGxfUClpSMpf0NSwP6YhZ+u7VzLP8Gsbchz+Ggz5vQ
         y3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713457952; x=1714062752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qw41A+dZx7I8Diykai2FpeK5mNXOqfbEJEaS+qGnKM=;
        b=rtKL5e4Q0VxVDQ073ijX0lJuZWhdoJo7i3OtJ8UAEBz5mJ/SyRPY41vCJJQkAxAA2H
         6fK6JnAyD45N8Jz9y8b5EiBjPMGAxdAvcF1mFsh3FXB/ZzXB4jemY50o43JdKoNhSBhi
         Zo4twOUh1eWsOLFfqXcgA0rBvQW4ak6JM+BddY8/VKDwlmWUj56pWfcU/3W185iDnXTW
         c2VhADYnNzJ2euuKN9qG8W0yOkfpmtTN/3fD/TlRRlw/amW5JOt7u8p3M7gkOTmsIP+W
         gmg894gSQZaI9/eX5n+cIa4yYp8M/jFfOfAC8M+iLlPvJ4/hrLaWCHHpin3LpL2+uQrg
         D67w==
X-Forwarded-Encrypted: i=1; AJvYcCUrQ0l8K99PVIzAJfPvfbBCqi4MfF2IQ3ukjTgnjl3T9G+CUdbi2EHhyfUO/Hgo4avX+y1FmnDWAD4Cz+lzsUn72NMqMj+JeMpNTCphP3g3
X-Gm-Message-State: AOJu0YxA9lxa9R7v3EUoHSvZfB6lzXLk+BC+CWicmcbDUb5IZQdjvtWF
	uO/4DjTYGPGzIjKbMhBSdMuQcksjSw3hxYYjPEOufxuLswaKz6oM4vwXvZX9QLA=
X-Google-Smtp-Source: AGHT+IGrx2JZaOHUbHgOAjjqs5+H2ptnSIVhy93nY5s3x5VPcvniqdkm0SstG8X7B934i3pyGqk/Hg==
X-Received: by 2002:a05:6a00:3a1d:b0:6e6:9af4:409a with SMTP id fj29-20020a056a003a1d00b006e69af4409amr3933457pfb.33.1713457952604;
        Thu, 18 Apr 2024 09:32:32 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm1674755pfl.31.2024.04.18.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 09:32:32 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 0/7] Linux RISC-V IOMMU Support
Date: Thu, 18 Apr 2024 09:32:18 -0700
Message-Id: <cover.1713456597.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_093236_390229_C1FA147A 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBSSVNDLVYgSU9NTVUgYXJj
aGl0ZWN0ZWQKaGFyZHdhcmUgaW50byB0aGUgTGludXgga2VybmVsLgoKVGhlIFJJU0MtViBJT01N
VSBzcGVjaWZpY2F0aW9uLCB3aGljaCB0aGlzIHNlcmllcyBpcyBiYXNlZCBvbiwgaXMKcmF0aWZp
ZWQgYW5kIGF2YWlsYWJsZSBhdCBHaXRIdWIvcmlzY3Ytbm9uLWlzYSBbMV0uCgpBdCBhIGhpZ2gg
bGV2ZWwsIHRoZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzOgoKMSkgRGF0YSBz
dHJ1Y3R1cmVzOgogIC0gRGV2aWNlLWNvbnRleHQ6IEFzc29jaWF0ZXMgZGV2aWNlcyB3aXRoIGFk
ZHJlc3Mgc3BhY2VzIGFuZCBob2xkcwogICAgcGVyLWRldmljZSBwYXJhbWV0ZXJzIGZvciBhZGRy
ZXNzIHRyYW5zbGF0aW9ucy4KICAtIFByb2Nlc3MtY29udGV4dHM6IEFzc29jaWF0ZXMgZGlmZmVy
ZW50IHZpcnR1YWwgYWRkcmVzcyBzcGFjZXMgYmFzZWQKICAgIG9uIGRldmljZS1wcm92aWRlZCBw
cm9jZXNzIGlkZW50aWZpY2F0aW9uIG51bWJlcnMuCiAgLSBNU0kgcGFnZSB0YWJsZSBjb25maWd1
cmF0aW9uIHVzZWQgdG8gZGlyZWN0IGFuIE1TSSB0byBhIGd1ZXN0CiAgICBpbnRlcnJ1cHQgZmls
ZSBpbiBhbiBJTVNJQy4KMikgSW4tbWVtb3J5IHF1ZXVlIGludGVyZmFjZToKICAtIENvbW1hbmQt
cXVldWUgZm9yIGlzc3VpbmcgY29tbWFuZHMgdG8gdGhlIElPTU1VLgogIC0gRmF1bHQvZXZlbnQg
cXVldWUgZm9yIHJlcG9ydGluZyBmYXVsdHMgYW5kIGV2ZW50cy4KICAtIFBhZ2UtcmVxdWVzdCBx
dWV1ZSBmb3IgcmVwb3J0aW5nICJQYWdlIFJlcXVlc3QiIG1lc3NhZ2VzIHJlY2VpdmVkCiAgICBm
cm9tIFBDSWUgZGV2aWNlcy4KICAtIE1lc3NhZ2Utc2lnbmFsZWQgYW5kIHdpcmUtc2lnbmFsZWQg
aW50ZXJydXB0IG1lY2hhbmlzbXMuCjMpIE1lbW9yeS1tYXBwZWQgcHJvZ3JhbW1pbmcgaW50ZXJm
YWNlOgogIC0gTWFuZGF0b3J5IGFuZCBvcHRpb25hbCByZWdpc3RlciBsYXlvdXQgYW5kIGRlc2Ny
aXB0aW9uLgogIC0gU29mdHdhcmUgZ3VpZGVsaW5lcyBmb3IgZGV2aWNlIGluaXRpYWxpemF0aW9u
IGFuZCBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LgoKClRoaXMgc2VyaWVzIGludHJvZHVjZXMgUklT
Qy1WIElPTU1VIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGFuZCBjb21wbGV0ZQpzaW5nbGUtc3Rh
Z2UgdHJhbnNsYXRpb24gd2l0aCBwYWdpbmcgZG9tYWluIHN1cHBvcnQuCgpUaGUgcGF0Y2hlcyBh
cmUgb3JnYW5pemVkIGFzIGZvbGxvd3M6CgpQYXRjaCAxOiBJbnRyb2R1Y2VzIG1pbmltYWwgcmVx
dWlyZWQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBkcml2ZXIuClBhdGNoIDI6IERlZmlu
ZXMgUklTQy1WIElPTU1VIGRhdGEgc3RydWN0dXJlcywgaGFyZHdhcmUgcHJvZ3JhbW1pbmcgaW50
ZXJmYWNlCiAgICAgICAgIHJlZ2lzdGVycyBsYXlvdXQsIGFuZCBtaW5pbWFsIGluaXRpYWxpemF0
aW9uIGNvZGUgZm9yIGVuYWJsaW5nIGdsb2JhbAogICAgICAgICBwYXNzLXRocm91Z2ggZm9yIGFs
bCBjb25uZWN0ZWQgbWFzdGVycy4KUGF0Y2ggMzogSW1wbGVtZW50cyB0aGUgZGV2aWNlIGRyaXZl
ciBmb3IgUENJZSBpbXBsZW1lbnRhdGlvbiBvZiBSSVNDLVYgSU9NTVUKICAgICAgICAgYXJjaGl0
ZWN0ZWQgaGFyZHdhcmUuClBhdGNoIDQ6IEludHJvZHVjZXMgSU9NTVUgaW50ZXJmYWNlcyB0byB0
aGUga2VybmVsIHN1YnN5c3RlbS4KUGF0Y2ggNTogSW1wbGVtZW50cyBkZXZpY2UgZGlyZWN0b3J5
IG1hbmFnZW1lbnQgd2l0aCBkaXNjb3Zlcnkgc2VxdWVuY2VzIGZvcgogICAgICAgICBJL08gbWFw
cGVkIG9yIGluLW1lbW9yeSBkZXZpY2UgZGlyZWN0b3J5IHRhYmxlIGxvY2F0aW9uLCBoYXJkd2Fy
ZQogICAgICAgICBjYXBhYmlsaXRpZXMgZGlzY292ZXJ5LCBhbmQgZGV2aWNlIHRvIGRvbWFpbiBh
dHRhY2ggaW1wbGVtZW50YXRpb24uClBhdGNoIDY6IEltcGxlbWVudHMgY29tbWFuZCBhbmQgZmF1
bHQgcXVldWUsIGFuZCBpbnRyb2R1Y2VzIGRpcmVjdG9yeSBjYWNoZQogICAgICAgICBpbnZhbGlk
YXRpb24gc2VxdWVuY2VzLgpQYXRjaCA3OiBJbXBsZW1lbnRzIHBhZ2luZyBkb21haW4sIHdpdGgg
cGFnZSB0YWJsZSB1c2luZyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlCiAgICAgICAgIENQVeKAmXMg
TU1VLiBUaGlzIHBhdGNoIHNlcmllcyBlbmFibGVzIG9ubHkgNEsgbWFwcGluZ3M7IGNvbXBsZXRl
IHN1cHBvcnQKICAgICAgICAgZm9yIGxhcmdlIHBhZ2UgbWFwcGluZ3Mgd2lsbCBiZSBpbnRyb2R1
Y2VkIGluIGZvbGxvdy11cCBwYXRjaCBzZXJpZXMuCgpGb2xsb3ctdXAgcGF0Y2ggc2VyaWVzLCBw
cm92aWRpbmcgbGFyZ2UgcGFnZSBzdXBwb3J0IGFuZCB1cGRhdGVkIHdhbGsgY2FjaGUKbWFuYWdl
bWVudCBiYXNlZCBvbiB0aGUgcmV2aXNlZCBzcGVjaWZpY2F0aW9uLCBhbmQgY29tcGxldGUgQVRT
L1BSSS9TVkEgc3VwcG9ydCwKd2lsbCBiZSBwb3N0ZWQgdG8gR2l0SHViIFsyXSBpbiB0aGUgbmV4
dCBmZXcgZGF5cy4KCkNoYW5nZXMgZnJvbSB2MToKCiAgVGhpcyB2ZXJzaW9uIGluY2x1ZGVzIG1h
am9yIHJlb3JnYW5pemF0aW9uIG9mIHRoZSBjb2RlIHJlbGF0ZWQgdG8gcXVldWUKICBhbmQgcGFn
ZSB0YWJsZSBtYW5hZ2VtZW50LCByZW1vdmFsIG9mIGFsbCBBVFMvUFJJL1NWQSBmZWF0dXJlcyB0
byBiZSBhZGRyZXNzZWQKICBpbiBmb2xsb3ctdXAgcGF0Y2ggc2VyaWVzLCByZW1vdmFsIG9mIHVu
bmVjZXNzYXJ5IGNoZWNrcywgYW5kIGFkb3B0aW9uIG9mIG5ldwogIGludGVyZmFjZXMgZm9yIGlk
ZW50aXR5IGFuZCBwYWdpbmcgZG9tYWluIGFsbG9jYXRpb25zLgoKQXBvbG9naWVzIGZvciB0aGUg
ZGVsYXkgaW4gc2VuZGluZyB2MiBzZXJpZXMsIGFuZCB0aGFuayB5b3UgZm9yIHZhbHVhYmxlIGZl
ZWRiYWNrCmFuZCBwYXRpZW5jZSB3aXRoIGxhc3QgcGF0Y2ggc2VyaWVzLgoKQmVzdCByZWdhcmRz
LAogVG9tYXN6IEplem5hY2gKClsxXSBsaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9u
LWlzYS9yaXNjdi1pb21tdQpbMl0gbGluazogaHR0cHM6Ly9naXRodWIuY29tL3RqZXpuYWNoL2xp
bnV4CnYxIGxpbms6ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS9jb3Zlci4x
Njg5NzkyODI1LmdpdC50amV6bmFjaEByaXZvc2luYy5jb20vCgpUb21hc3ogSmV6bmFjaCAoNyk6
CiAgZHQtYmluZGluZ3M6IGlvbW11OiByaXNjdjogQWRkIGJpbmRpbmdzIGZvciBSSVNDLVYgSU9N
TVUKICBpb21tdS9yaXNjdjogQWRkIFJJU0MtViBJT01NVSBwbGF0Zm9ybSBkZXZpY2UgZHJpdmVy
CiAgaW9tbXUvcmlzY3Y6IEFkZCBSSVNDLVYgSU9NTVUgUENJZSBkZXZpY2UgZHJpdmVyCiAgaW9t
bXUvcmlzY3Y6IEVuYWJsZSBJT01NVSByZWdpc3RyYXRpb24gYW5kIGRldmljZSBwcm9iZS4KICBp
b21tdS9yaXNjdjogRGV2aWNlIGRpcmVjdG9yeSBtYW5hZ2VtZW50LgogIGlvbW11L3Jpc2N2OiBD
b21tYW5kIGFuZCBmYXVsdCBxdWV1ZSBzdXBwb3J0CiAgaW9tbXUvcmlzY3Y6IFBhZ2luZyBkb21h
aW4gc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9pb21tdS9yaXNjdixpb21tdS55YW1sICAgICAgICAg
ICB8ICAxNDkgKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMTQgKwogZHJpdmVycy9pb21tdS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgMSArCiBkcml2ZXJzL2lvbW11L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAyICstCiBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAgIDIzICsKIGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8
ICAgIDMgKwogZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmggICAgICAgICAgICAgIHwg
IDc4MiArKysrKysrKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMgICAgICAgICAg
ICAgICB8ICAxNTQgKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyAgICAg
ICAgICB8ICAgOTQgKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAgICAgICAgICAg
ICAgICB8IDE0NDEgKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUu
aCAgICAgICAgICAgICAgICAgICB8ICAgODggKwogMTEgZmlsZXMgY2hhbmdlZCwgMjc1MCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS1iaXRzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LXBjaS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS1wbGF0Zm9ybS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5o
CgoKYmFzZS1jb21taXQ6IDBiYmFjM2ZhY2I1ZDZjYzAxNzFjNDVjOTg3M2EyZGM5NmJlYTk2ODAK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
