Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D18C61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkW3EMqpIp+msJ/gVehOLYcIO+mJoJ4973RohwLnZf4=; b=2e9beGxCYT5v7k
	81yBiFavJKfSOnk1kffCdJU0qh16nqxnFlfEJvAy6oTNU8qnqiEOsAfVD9Jb8lCYNM57weLp2bhpW
	uzWaEmoSQrxlRJJXBs3JTuR3pkQIuMgQUiBMqLN2t9cO7uxyYDXedIXRDuTaULOXeRwOWEhFUpsPY
	KCbnkkxKt+KVM+yYGbjls4G6JPkNR7wNhfEcn2dZtFMCSPjyeNlB/O4Xc/N98IRV67zlJqEfJp3fb
	9rPbwP9wqt0EBwGfjoTja1N4nEBTC9603P3DrzzmoFV9OoQUw8F6E3BVjyLp5xM9MXcJ+V2X6PeB0
	nlACR3xrltIgyQT7XSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5znO-003blY-1i;
	Thu, 23 Nov 2023 02:50:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5znK-003bkZ-2z;
	Thu, 23 Nov 2023 02:50:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507b9408c61so537800e87.0;
        Wed, 22 Nov 2023 18:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700707819; x=1701312619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D08p5YAHoEvBUZt7xMX5L9P22HbicVdwPxBXjnz6Npw=;
        b=nYOxJGVqakoONqo/X3sPuv5KC/D3ff1xVQrRL4FwZqhTedYr6dJpRMF1Q40Jomf/sO
         HP4Sg3PRxlw2S24bQBDA3kNTCxcV6vSdPI5Hhm8Gh9RNy5BYcr2TO+vJ68KKPUOFCt0P
         h3jMaH0SVqoFANWIjvHamt3Ob1SVoQCwaswjB7lD8f3mbpBtQ9Ix7KdtputC9o7m2KEI
         8Z7oifyA4CgmYjbJciZQSokcRKSsq6J7zTCx1j2EqvFyqQ72ifihzzrJ/LrL8ZAJqlUh
         vgGplhfBGNgOQcg4V/EL8Eopfu2vUfRSaTRnM4rgCnndnHVqFG/KUS7gRYnE2OGeiLdC
         rD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700707819; x=1701312619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D08p5YAHoEvBUZt7xMX5L9P22HbicVdwPxBXjnz6Npw=;
        b=J+962udla0u8HYxjs2LUKmsAkdxnbliF/VL1bkRahMD2igalSEDW1cSux69niPr+kV
         T6J4p/nE4BXvT9+Dfxv1GsIOxUxeFVaFeddj6hsSN3vQeASeO0Uv+YsY442gkLOuqoWv
         5+oLS+dIwoQJgAHyp86YFB587a5ri0YRWPTHe53hU2oq4e3DUhsQnxdnggeGtEP4kMRR
         toRS1BGsE1s3LxkZ4CZoJs7RlfkVbl1w0Rcdd4Vwr2sF98iA5SLWtg3BDg5CwtMsOgbH
         YzjWfzWvkHSVwbsJ1dfsGnvpnHMD5LbVx1Hz1crmb5xEtHhND35J0uww27QXJO4xb5TM
         k/rg==
X-Gm-Message-State: AOJu0YxYtNjweyfkn21+RTrA81vTuChIRw0tNxm6yLnbYDKkLwSAPCH8
	Q8MybIo+Frj2W5PxHxjoWG7ajxvsrObwlpOQBuI=
X-Google-Smtp-Source: AGHT+IHYfupwzu0CW6znUvnxSIcpycCfMCyG5yvT7i4wgCWs3TEwSE0e3Jej9CVUNIj28w27da85FVVMqHACxKhDkTk=
X-Received: by 2002:a05:6512:158e:b0:507:a766:ad27 with SMTP id
 bp14-20020a056512158e00b00507a766ad27mr4204558lfb.16.1700707818800; Wed, 22
 Nov 2023 18:50:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1694421911.git.haibo1.xu@intel.com> <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
 <20231003-d44206f71d0b22e539833697@orel> <CAJve8o=Q74U0Z3PayrzY7heNc0qeTw5VYS+tdkpm=aJdefQEbQ@mail.gmail.com>
 <20231122-b471122622059496906801c1@orel>
In-Reply-To: <20231122-b471122622059496906801c1@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 23 Nov 2023 10:50:07 +0800
Message-ID: <CAJve8o=gsY=qQUce-Z25p6C2BO5eLnH9N=MxjcdX0v0hFKN8kw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] KVM: selftests: Unify the makefile rule for split targets
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_185022_963432_257674BE 
X-CRM114-Status: GOOD (  24.68  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDoxM+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMTA6NTg6
NTdBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDY6
MjjigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMDk6MzY6NTZBTSArMDgwMCwgSGFpYm8g
WHUgd3JvdGU6Cj4gPiA+ID4gQSBzZXBhcmF0ZSBtYWtlZmlsZSBydWxlIHdhcyB1c2VkIGZvciBz
cGxpdCB0YXJnZXRzIHdoaWNoIHdhcyBhZGRlZAo+ID4gPiA+IGluIHBhdGNoKEtWTTogYXJtNjQ6
IHNlbGZ0ZXN0czogU3BsaXQgZ2V0LXJlZy1saXN0IHRlc3QgY29kZSkuIFRoaXMKPiA+ID4gPiBj
b3VsZCBiZSBhdm9pZGVkIGJ5IG1pbm9yIGNoYW5nZXMgdG8gdGhlIHJlY2lwZXMgb2YgY3VycmVu
dCBydWxlLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54
dUBpbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9NYWtlZmlsZSB8IDYgKystLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL01ha2VmaWxlCj4gPiA+ID4gaW5kZXggYTNiYjM2ZmIzY2ZjLi43OTcyMjY5ZThjNWYg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxl
Cj4gPiA+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlCj4gPiA+
ID4gQEAgLTI0OSwxMyArMjQ5LDEwIEBAIFRFU1RfREVQX0ZJTEVTICs9ICQocGF0c3Vic3QgJS5v
LCAlLmQsICQoU1BMSVRfVEVTVFNfT0JKUykpCj4gPiA+ID4gIC1pbmNsdWRlICQoVEVTVF9ERVBf
RklMRVMpCj4gPiA+ID4KPiA+ID4gPiAgJChURVNUX0dFTl9QUk9HUykgJChURVNUX0dFTl9QUk9H
U19FWFRFTkRFRCk6ICU6ICUubwo+ID4gPiA+IC0gICAgICQoQ0MpICQoQ0ZMQUdTKSAkKENQUEZM
QUdTKSAkKExERkxBR1MpICQoVEFSR0VUX0FSQ0gpICQ8ICQoTElCS1ZNX09CSlMpICQoTERMSUJT
KSAtbyAkQAo+ID4gPiA+ICsgICAgICQoQ0MpICQoQ0ZMQUdTKSAkKENQUEZMQUdTKSAkKExERkxB
R1MpICQoVEFSR0VUX0FSQ0gpICReICQoTERMSUJTKSAtbyAkQAo+ID4gPiA+ICAkKFRFU1RfR0VO
X09CSik6ICQoT1VUUFVUKS8lLm86ICUuYwo+ID4gPiA+ICAgICAgICQoQ0MpICQoQ0ZMQUdTKSAk
KENQUEZMQUdTKSAkKFRBUkdFVF9BUkNIKSAtYyAkPCAtbyAkQAo+ID4gPiA+Cj4gPiA+ID4gLSQo
U1BMSVRfVEVTVFNfVEFSR0VUUyk6ICU6ICUubyAkKFNQTElUX1RFU1RTX09CSlMpCj4gPiA+ID4g
LSAgICAgJChDQykgJChDRkxBR1MpICQoQ1BQRkxBR1MpICQoTERGTEFHUykgJChUQVJHRVRfQVJD
SCkgJF4gJChMRExJQlMpIC1vICRACj4gPiA+ID4gLQo+ID4gPiA+ICBFWFRSQV9DTEVBTiArPSAk
KExJQktWTV9PQkpTKSAkKFRFU1RfREVQX0ZJTEVTKSAkKFRFU1RfR0VOX09CSikgJChTUExJVF9U
RVNUU19PQkpTKSBjc2NvcGUuKgo+ID4gPiA+Cj4gPiA+ID4gIHggOj0gJChzaGVsbCBta2RpciAt
cCAkKHNvcnQgJChkaXIgJChMSUJLVk1fQ19PQkopICQoTElCS1ZNX1NfT0JKKSkpKQo+ID4gPiA+
IEBAIC0yNzQsNiArMjcxLDcgQEAgJChMSUJLVk1fU1RSSU5HX09CSik6ICQoT1VUUFVUKS8lLm86
ICUuYwo+ID4gPiA+ICB4IDo9ICQoc2hlbGwgbWtkaXIgLXAgJChzb3J0ICQoZGlyICQoVEVTVF9H
RU5fUFJPR1MpKSkpCj4gPiA+ID4gICQoVEVTVF9HRU5fUFJPR1MpOiAkKExJQktWTV9PQkpTKQo+
ID4gPiA+ICAkKFRFU1RfR0VOX1BST0dTX0VYVEVOREVEKTogJChMSUJLVk1fT0JKUykKPiA+ID4g
PiArJChTUExJVF9URVNUU19UQVJHRVRTKTogJChPVVRQVVQpLyU6ICQoQVJDSF9ESVIpLyUubwo+
ID4gPiA+Cj4gPiA+ID4gIGNzY29wZTogaW5jbHVkZV9wYXRocyA9ICQoTElOVVhfVE9PTF9JTkNM
VURFKSAkKExJTlVYX0hEUl9QQVRIKSBpbmNsdWRlIGxpYiAuLgo+ID4gPiA+ICBjc2NvcGU6Cj4g
PiA+ID4gLS0KPiA+ID4gPiAyLjM0LjEKPiA+ID4gPgo+ID4gPgo+ID4gPiBJIGp1c3Qgbm90aWNl
ZCB0aGF0IHdpdGggYW5kIHdpdGhvdXQgdGhpcyBwYXRjaCB3ZSdyZSBidWlsZGluZyB0aGUKPiA+
ID4gYXJjaC1zcGVjaWZpYyBwYXJ0IGluIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
diBldmVuIHdoZW4gd2UgaGF2ZQo+ID4gPiBhbiAkKE9VVFBVVCkgZGlyZWN0b3J5IChlLmcuIE89
YnVpbGQpLiBUaG9zZSBidWlsZCBhcnRpZmFjdHMgc2hvdWxkIGJlIGluCj4gPiA+IGJ1aWxkL2tz
ZWxmdGVzdC9rdm0vcmlzY3YgaW5zdGVhZC4KPiA+ID4KPiA+Cj4gPiBUaGFua3MgZm9yIHBvaW50
aW5nIGl0IG91dC4gSSB3aWxsIGhhdmUgYSBsb29rIGluIG5leHQgd2VlayEKPiA+Cj4KPiBIaSBI
YWlibywKPgo+IFBhb2xvIGp1c3QgZml4ZWQgdGhpcwo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMxMTIxMTY1NjMxLjExNzA3OTctMS1wYm9uemluaUByZWRoYXQuY29tLwo+CgpU
aGFua3MgZm9yIHRoZSBpbmZvISBJIHdpbGwgcmViYXNlIHRoZSBwYXRjaCBzZXQgaW4gbmV4dCB2
ZXJzaW9uLgoKVGhhbmtzLApIYWlibwoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
