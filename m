Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE338EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpznLunFPmwlcDoaQ7x/zLVNRVvUdI4VHN5eDu4oUV4=; b=H+CR2c6pKjH3RT
	AI5pLo+8L3K30VQvZVCuv13CVIrHGveg29XChFORexo8xIOYQA9YPZ4WX4Axqc9sAiiHOaT8pvk3O
	bcZX/6wVwe2FyjNt2DudWhQikeRwu3OgJTLQfzbOdmoMGYMY41HrgM91otdQSnoAOF2E0e6hC3415
	2h/c0xhIJQNopaJ+k/jUeBmRCKvK+zfgpszoR4FqignZBUNyi5LoZs5ogpv5eeHOBl278BECeGZSl
	QeTPQ3JwNwFiG7gPbBlA76c+4vs2C4RHDFk/93zwf4kQjAF5OXSHM8FtZAAYt3gXeYeHTcjuX4yBb
	vQ0rVfcfKcHmV8HCWU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHF2-00EJMH-2L;
	Tue, 27 Jun 2023 22:32:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEHEy-00EJKy-36
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 22:32:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fba66f3e1dso12181675e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1687905168; x=1690497168;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96mjTfQ9kY+9YoQpS1KAZ12o+s7Q28O5zoNqhn0CFLw=;
        b=KHKX3x3/xnUbcE9dNXX+UPf5rVUm/vAXIfnMCaYvfN1O7zLXkWxkqIr4fXCFAysZK0
         U17/JvZ8Aicy8einjjOf+lGga/SqFh+KbN5MByku+rszdWVtxLflpzmRQPPsw+sQdtca
         ARq389WyD4Dd2msj2BusZkJoBeyqFHo8GM/qFd/HolyIyIdStUG+TLyE1q/Pe9S74tHD
         i2LWaAyS7k/QA4X9zG/yL8pQ0Dep8F8f2f5SyG667W2UhSMVDaeVPEuCBuc1zL4NtjBb
         Ax1d+hTE8ixM8M1YIpxBGdwKN6hj7wI/ofutyUJS2eAFrUTKVMmuzlo8sTKekWhf+XcJ
         Qe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687905168; x=1690497168;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96mjTfQ9kY+9YoQpS1KAZ12o+s7Q28O5zoNqhn0CFLw=;
        b=f7MByfUdGj5fU5KpgfzBzten4ugnM2b23riuAHsSXU/KYfUDvmVqJGsh1ISXurl2Hu
         OjCAtVi51pZPMV+ywkhYQBf/KS1biSpPgpRvMZrS1gyk0FMQkxVeB2yqYJv1ZrctL6Px
         J7g14Lyk4prlHx2+y+GeAtav56Y4HT6Ofbr+dW7Ec9aEd09c6wo2fIvA0JVKLEqwq2yQ
         Odwy8u3A37H2uOgH2ppb8Xiw85m2GwXWqRIrS8yeo3LhzHFjDJHAPf+k8313kCGLsd58
         JHWvjsDcETs0wRyzC9CR6GlaIBZzusy1DQT4XnfkPi1eb8JELw41p6iT1R+7xixCKfA8
         /LSQ==
X-Gm-Message-State: AC+VfDyDj/xYAnDJ6nWl3Ay9lJzNIXSBBjaHnzKhmysofIq2dLqmY2Ig
	xe6PKeMDmqCBjnVZDhKZ//dUPQ==
X-Google-Smtp-Source: ACHHUZ56C4bQwPWT98hnSB+uKRS/WOCZaRkYvpaAwhlzkOui1rGSOpdwJa8Wm1Cus+cWjuCmOvVmQA==
X-Received: by 2002:a7b:cd89:0:b0:3fa:7991:52b3 with SMTP id y9-20020a7bcd89000000b003fa799152b3mr9680786wmj.5.1687905168246;
        Tue, 27 Jun 2023 15:32:48 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bce05000000b003fbaade0735sm1622625wmc.19.2023.06.27.15.32.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2023 15:32:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230627222152.177716-2-charlie@rivosinc.com>
Date: Tue, 27 Jun 2023 23:32:36 +0100
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Atish Patra <atishp@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 bjorn@rivosinc.com,
 Anup Patel <anup@brainfault.org>,
 Evan Green <evan@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Message-Id: <473F7474-D7AA-4C9F-95A3-320F1741EC50@jrtc27.com>
References: <20230627222152.177716-1-charlie@rivosinc.com>
 <20230627222152.177716-2-charlie@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_153253_063456_3EEBBBC0 
X-CRM114-Status: GOOD (  27.18  )
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

T24gMjcgSnVuIDIwMjMsIGF0IDIzOjIxLCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPiB3cm90ZToKPiAKPiBNYWtlIHN2MzkgdGhlIGRlZmF1bHQgYWRkcmVzcyBzcGFjZSBm
b3IgbW1hcCBhcyBzb21lIGFwcGxpY2F0aW9ucwo+IGN1cnJlbnRseSBkZXBlbmQgb24gdGhpcyBh
c3N1bXB0aW9uLgoKVGhleSBhcmUganVzdCBwbGFpbiB3cm9uZyB0b28uIFN2NDggd2FzIGluIGV2
ZW4gUHJpdiB2MS4xMCAodGhlIGZpcnN0CnNwZWMgd2hlcmUgc2F0cCB3YXMgbmFtZWQgYXMgc3Vj
aCBhbmQgY29udGFpbmVkIHRoZSBtb2RlLCByYXRoZXIgdGhhbgpyZXF1aXJpbmcgTS1tb2Rl4oCZ
cyBoZWxwIGluIGNvbmZpZ3VyaW5nIHZpcnR1YWwgbWVtb3J5KSwgcHJlZGF0aW5nIHRoZQpyYXRp
ZmllZCB2MS4xMSBzcGVjLiBBIDM5LWJpdCBhZGRyZXNzIHNwYWNlIGlzIHBhdGhldGljIGFuZCBo
YXMKaW1wbGljYXRpb25zIGZvciBBU0xSLgoKSSBzdHJvbmdseSBzdWdnZXN0IGFwcGxpY2F0aW9u
cyBiZSBmb3JjZWQgdG8gc3VwcG9ydCBhdCBsZWFzdCBTdjQ4LAp3aGljaCBpcyB0b3RhbGx5IHJl
YXNvbmFibGUgZ2l2ZW4gdGhlIGFkZHJlc3Mgc3BhY2Ugc2l6ZXMgdXNlZCBieSBvdGhlcgphcmNo
aXRlY3R1cmVzLiBTdjU3IGlzIG1vcmUgZGlzcnVwdGl2ZSB0byBzb21lIHJ1bnRpbWVzLCB0aG91
Z2ggaWRlYWxseQpldmVuIHRoYXQgd291bGQgYmUgZnJlZSBmb3IgdGhlIGtlcm5lbCB0byB1c2Ug
cmF0aGVyIHRoYW4gY29tbWl0dGluZyB0bwpub3QgdXNpbmcgaXQgZm9yIHRoZSBkZWZhdWx0IHVB
QkkuCgpKZXNzCgo+IFRoZSBSSVNDLVYgc3BlY2lmaWNhdGlvbiBlbmZvcmNlcwo+IHRoYXQgYml0
cyBvdXRzaWRlIG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgYXJlIG5vdCB1c2VkLCBzbwo+
IHJlc3RyaWN0aW5nIHRoZSBzaXplIG9mIHRoZSBkZWZhdWx0IGFkZHJlc3Mgc3BhY2UgYXMgc3Vj
aCBzaG91bGQgYmUKPiB0ZW1wb3JhcnkuIEEgaGludCBhZGRyZXNzIHBhc3NlZCB0byBtbWFwIHdp
bGwgY2F1c2UgdGhlIGxhcmdlc3QgYWRkcmVzcwo+IHNwYWNlIHRoYXQgZml0cyBlbnRpcmVseSBp
bnRvIHRoZSBoaW50IHRvIGJlIHVzZWQuIElmIHRoZSBoaW50IGlzIGxlc3MKPiB0aGFuIG9yIGVx
dWFsIHRvIDE8PDM4LCBhIDM5LWJpdCBhZGRyZXNzIHdpbGwgYmUgdXNlZC4gQWZ0ZXIgYW4gYWRk
cmVzcwo+IHNwYWNlIGlzIGNvbXBsZXRlbHkgZnVsbCwgdGhlIG5leHQgc21hbGxlc3QgYWRkcmVz
cyBzcGFjZSB3aWxsIGJlIHVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5z
IDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vs
Zi5oICAgICAgIHwgIDIgKy0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgIHwg
MTMgKysrKysrKysrLQo+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZWxmLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gaW5kZXggMzBl
N2QyNDU1OTYwLi4xYjU3ZjEzYTFhZmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9lbGYuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiBAQCAtNDks
NyArNDksNyBAQCBleHRlcm4gYm9vbCBjb21wYXRfZWxmX2NoZWNrX2FyY2goRWxmMzJfRWhkciAq
aGRyKTsKPiAgKiB0aGUgbG9hZGVyLiAgV2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBpdCBpcyBv
dXQgb2YgdGhlIHdheSBvZiB0aGUgcHJvZ3JhbQo+ICAqIHRoYXQgaXQgd2lsbCAiZXhlYyIsIGFu
ZCB0aGF0IHRoZXJlIGlzIHN1ZmZpY2llbnQgcm9vbSBmb3IgdGhlIGJyay4KPiAgKi8KPiAtI2Rl
ZmluZSBFTEZfRVRfRFlOX0JBU0UgKChUQVNLX1NJWkUgLyAzKSAqIDIpCj4gKyNkZWZpbmUgRUxG
X0VUX0RZTl9CQVNFICgoREVGQVVMVF9NQVBfV0lORE9XIC8gMykgKiAyKQo+IAo+ICNpZmRlZiBD
T05GSUdfNjRCSVQKPiAjaWZkZWYgQ09ORklHX0NPTVBBVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4gaW5kZXggNzU5NzBlZTJiZGEyLi5lODM5MTJlOTc4NzAgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+IEBAIC01NywxOCArNTcsMjkgQEAKPiAjZGVmaW5lIE1PRFVMRVNfRU5E
IChQRk5fQUxJR04oKHVuc2lnbmVkIGxvbmcpJl9zdGFydCkpCj4gI2VuZGlmCj4gCj4gKwo+IC8q
Cj4gICogUm91Z2hseSBzaXplIHRoZSB2bWVtbWFwIHNwYWNlIHRvIGJlIGxhcmdlIGVub3VnaCB0
byBmaXQgZW5vdWdoCj4gICogc3RydWN0IHBhZ2VzIHRvIG1hcCBoYWxmIHRoZSB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UuIFRoZW4KPiAgKiBwb3NpdGlvbiB2bWVtbWFwIGRpcmVjdGx5IGJlbG93IHRo
ZSBWTUFMTE9DIHJlZ2lvbi4KPiAgKi8KPiAjaWZkZWYgQ09ORklHXzY0QklUCj4gKyNkZWZpbmUg
VkFfQklUU19TVjM5IDM5Cj4gKyNkZWZpbmUgVkFfQklUU19TVjQ4IDQ4Cj4gKyNkZWZpbmUgVkFf
QklUU19TVjU3IDU3Cj4gKwo+ICsjZGVmaW5lIFZBX1VTRVJfU1YzOSAoVUwoMSkgPDwgKFZBX0JJ
VFNfU1YzOSAtIDEpKQo+ICsjZGVmaW5lIFZBX1VTRVJfU1Y0OCAoVUwoMSkgPDwgKFZBX0JJVFNf
U1Y0OCAtIDEpKQo+ICsjZGVmaW5lIFZBX1VTRVJfU1Y1NyAoVUwoMSkgPDwgKFZBX0JJVFNfU1Y1
NyAtIDEpKQo+ICsKPiAjZGVmaW5lIFZBX0JJVFMgKHBndGFibGVfbDVfZW5hYmxlZCA/IFwKPiAt
IDU3IDogKHBndGFibGVfbDRfZW5hYmxlZCA/IDQ4IDogMzkpKQo+ICsgVkFfQklUU19TVjU3IDog
KHBndGFibGVfbDRfZW5hYmxlZCA/IFZBX0JJVFNfU1Y0OCA6IFZBX0JJVFNfU1YzOSkpCj4gI2Vs
c2UKPiAjZGVmaW5lIFZBX0JJVFMgMzIKPiAjZW5kaWYKPiAKPiArI2RlZmluZSBERUZBVUxUX1ZB
X0JJVFMgKChWQV9CSVRTID49IFZBX0JJVFNfU1YzOSkgPyBWQV9CSVRTX1NWMzkgOiBWQV9CSVRT
KQo+ICsKPiAjZGVmaW5lIFZNRU1NQVBfU0hJRlQgXAo+IChWQV9CSVRTIC0gUEFHRV9TSElGVCAt
IDEgKyBTVFJVQ1RfUEFHRV9NQVhfU0hJRlQpCj4gI2RlZmluZSBWTUVNTUFQX1NJWkUgQklUKFZN
RU1NQVBfU0hJRlQpCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gaW5kZXggNmZiOGJi
ZWM4NDU5Li4wMTlkY2Q0ZWNhZTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgK
PiBAQCAtMTIsMjAgKzEyLDQ3IEBACj4gCj4gI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPiAKPiAt
LyoKPiAtICogVGhpcyBkZWNpZGVzIHdoZXJlIHRoZSBrZXJuZWwgd2lsbCBzZWFyY2ggZm9yIGEg
ZnJlZSBjaHVuayBvZiB2bQo+IC0gKiBzcGFjZSBkdXJpbmcgbW1hcCdzLgo+IC0gKi8KPiAtI2Rl
ZmluZSBUQVNLX1VOTUFQUEVEX0JBU0UgUEFHRV9BTElHTihUQVNLX1NJWkUgLyAzKQo+IC0KPiAt
I2RlZmluZSBTVEFDS19UT1AgVEFTS19TSVpFCj4gI2lmZGVmIENPTkZJR182NEJJVAo+ICsjZGVm
aW5lIERFRkFVTFRfTUFQX1dJTkRPVyAoVUwoMSkgPDwgKERFRkFVTFRfVkFfQklUUyAtIDEpKQo+
ICNkZWZpbmUgU1RBQ0tfVE9QX01BWCBUQVNLX1NJWkVfNjQKPiArCj4gKyNkZWZpbmUgYXJjaF9n
ZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFncykgXAo+ICsgKChhZGRyKSA9PSAwIHx8IChhZGRy
KSA+PSBWQV9VU0VSX1NWNTcgPyBTVEFDS19UT1BfTUFYIDogICBcCj4gKyAoKChhZGRyKSA+PSBW
QV9VU0VSX1NWNDgpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y0OCkpID8gXAo+ICsgVkFfVVNF
Ul9TVjQ4IDogXAo+ICsgVkFfVVNFUl9TVjM5KQo+ICsKPiArI2RlZmluZSBhcmNoX2dldF9tbWFw
X2Jhc2UoYWRkciwgYmFzZSkgXAo+ICsgKCgoYWRkciA+PSBWQV9VU0VSX1NWNTcpICYmIChWQV9C
SVRTID49IFZBX0JJVFNfU1Y1NykpID8gICBcCj4gKyBiYXNlICsgU1RBQ0tfVE9QX01BWCAtIERF
RkFVTFRfTUFQX1dJTkRPVyA6IFwKPiArICgoKGFkZHIpID49IFZBX1VTRVJfU1Y0OCkgJiYgKFZB
X0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgPyBcCj4gKyBiYXNlICsgVkFfVVNFUl9TVjQ4IC0gREVG
QVVMVF9NQVBfV0lORE9XIDogXAo+ICsgYmFzZSkKPiArCj4gI2Vsc2UKPiArI2RlZmluZSBERUZB
VUxUX01BUF9XSU5ET1cgVEFTS19TSVpFCj4gI2RlZmluZSBTVEFDS19UT1BfTUFYIFRBU0tfU0la
RQo+ICsKPiArI2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKSBcCj4g
KyAoKGFkZHIpID4gREVGQVVMVF9NQVBfV0lORE9XID8gU1RBQ0tfVE9QX01BWCA6IERFRkFVTFRf
TUFQX1dJTkRPVykKPiArCj4gKyNkZWZpbmUgYXJjaF9nZXRfbW1hcF9iYXNlKGFkZHIsIGJhc2Up
IFwKPiArICgoYWRkciA+IERFRkFVTFRfTUFQX1dJTkRPVykgPyBcCj4gKyBiYXNlICsgU1RBQ0tf
VE9QX01BWCAtIERFRkFVTFRfTUFQX1dJTkRPVyA6IFwKPiArIGJhc2UpCj4gKwo+ICNlbmRpZgo+
ICNkZWZpbmUgU1RBQ0tfQUxJR04gMTYKPiAKPiArCj4gKyNkZWZpbmUgU1RBQ0tfVE9QIERFRkFV
TFRfTUFQX1dJTkRPVwo+ICsKPiArLyoKPiArICogVGhpcyBkZWNpZGVzIHdoZXJlIHRoZSBrZXJu
ZWwgd2lsbCBzZWFyY2ggZm9yIGEgZnJlZSBjaHVuayBvZiB2bQo+ICsgKiBzcGFjZSBkdXJpbmcg
bW1hcCdzLgo+ICsgKi8KPiArI2RlZmluZSBUQVNLX1VOTUFQUEVEX0JBU0UgUEFHRV9BTElHTihE
RUZBVUxUX01BUF9XSU5ET1cgLyAzKQo+ICsKPiAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+IAo+IHN0
cnVjdCB0YXNrX3N0cnVjdDsKPiAtLSAKPiAyLjM0LjEKPiAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
