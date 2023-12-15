Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOYtNZKzGcLA0bfWUeqjg+ESIUYC2MW3VyNETOXLcHA=; b=OdO9NZf5Odes1N
	791uWYpYfmPtDSmnrveHJDZgO85qAlGG660Yo9vo5BIkffx0xBqMLoikY58qZy4mXrba3lOL38sVJ
	VQouVU7mvlIP4Y6mQUdVhqf197lr2L+zrAH18RsQpiWgUZhfGF+9xRQGh3o0T97jJ3izia6a3vtzg
	CQc//j2PXA/oPpcCCxZTLXJtoIMO/fOEd+nQshoOkoX8zD2R0Fpl5UIVnLVR3ICNo/RXjQkJS+IWH
	iPx1t6gEVzshd0j8xnKFIKIRkZY4jyAP8I9mRLw4ublhx/Edc7AG0si48JdGPDSWRm7wIdLH0GwJE
	Nxpg3QAumpgqGTfSnvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Qf-002cTR-0y;
	Fri, 15 Dec 2023 09:24:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Qb-002cSg-2B
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 09:24:19 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28abb389323so101932a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 01:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702632257; x=1703237057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkgdTuSLIkBNaoAKVjs8cxc7sn+txwKysv6tc6DJg+o=;
        b=fEsZuLWhqViTR6l/XlDWjQMAth24nPojKu+gnFodJIasOaeOnlqXIagM7sJ/cRjQ52
         rKy3ALVJN6IYy5DaB7mi23pCNRzYuhY6tRC5R9NxlPcqtaO0X5FoPanu9weflW37zdxE
         2ZqgYkUguQyRb6senFJXLRAUJCc1LrJEaXrX+RxBCDKzDo8Wy51Fa0hQa42ChwakI9Wr
         M9TeZ9plf0qyb59TPxCTiL9w2/lR53LQaQvc49KsjWfet3cNOE0ULoRD+kIYY/rhc4zk
         vQHiQP6VXzfkf/y/jbzuBCWNnPmYhpJiriGrL18ARJnN5et3DaUfaz3QZt2hSR04jEq3
         emKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702632257; x=1703237057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkgdTuSLIkBNaoAKVjs8cxc7sn+txwKysv6tc6DJg+o=;
        b=s0Sco7GToj5VqT3ibffDgp7RbTy4htLRrKslG9tJwojy4weYFFlkeHKcnVajN7mswu
         ssckj0Y0UCfcSXaJwY5gxygFbo1OWI1TJUwsXcL9VNlLLUsxXEV7F1PPGCkTr1i4IMOK
         ZMbTLnopIEU52X+SOV+KM7sW9LDi0gbB6uFGRPsq18tpfcs6GHzFyeoKFbc1nqquz5r8
         IKEVgWxdcJrIPJV2LKID47JdLW0ZGVOX5OTAnYJTwIMF/ewOhM2YXjCQu5GMS1jaTcfB
         //FdzfvIuQ0YvTcdZn/hyQPqHH1CH1iDSxLLt+vq0tpJpe4MNbVzWGuMy3mYfAjsfHHS
         nLMg==
X-Gm-Message-State: AOJu0YwwP0tXzbYWlCYk7Aef4b94M95IwUZRPYUmKknFbab38sKAzxRz
	JWd5e89ABOAjIwMDdQrYfrCtoBjzBTQVtf+ObuS2Iw==
X-Google-Smtp-Source: AGHT+IEDhHjdwldw+YUG2ayrb/iQibGTQtHNdcpFnvLV7h0Skd/NDf46TArN18pJvSRR6U+FjE/vLCIgXdM3qyXvvZU=
X-Received: by 2002:a17:90a:7143:b0:286:7ec4:e701 with SMTP id
 g3-20020a17090a714300b002867ec4e701mr5439840pjs.31.1702632256854; Fri, 15 Dec
 2023 01:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-27-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-27-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:54:04 +0530
Message-ID: <CAAhSdy3xYTQP8EzB1+1Vw+sa-KAzXOhSUwBeKW+spQUjsPgmxg@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] RISC-V: KVM: selftests: Add steal_time test support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_012417_719386_087DACFF 
X-CRM114-Status: GOOD (  19.84  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHN0ZWFs
LXRpbWUgYWNjb3VudGluZyBzdXBwb3J0IGZvcgo+IFJJU0MtViBLVk0gd2UgY2FuIGFkZCBSSVND
LVYgc3VwcG9ydCB0byB0aGUgc3RlYWxfdGltZSB0ZXN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4g
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZSAgICAgICAgICB8ICA1ICstCj4g
IC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggICB8ICAxICsKPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3N0ZWFsX3RpbWUuYyAgICAgIHwgOTkgKysrKysr
KysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9N
YWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZQo+IGluZGV4IDk2
MzQzNTk1OWE5Mi4uNGJmNGY1MjM0MWE4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9N
YWtlZmlsZQo+IEBAIC0xOTQsMTIgKzE5NCwxMyBAQCBURVNUX0dFTl9QUk9HU19zMzkweCArPSBr
dm1fYmluYXJ5X3N0YXRzX3Rlc3QKPgo+ICBURVNUX0dFTl9QUk9HU19yaXNjdiArPSBkZW1hbmRf
cGFnaW5nX3Rlc3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZGlydHlfbG9nX3Rlc3QKPiAt
VEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZ3Vlc3RfcHJpbnRfdGVzdAo+ICBURVNUX0dFTl9QUk9H
U19yaXNjdiArPSBnZXQtcmVnLWxpc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZ3Vlc3Rf
cHJpbnRfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19yaXNjdiArPSBrdm1fYmluYXJ5X3N0YXRzX3Rl
c3QKPiAgVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX2NyZWF0ZV9tYXhfdmNwdXMKPiAgVEVT
VF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX3BhZ2VfdGFibGVfdGVzdAo+ICBURVNUX0dFTl9QUk9H
U19yaXNjdiArPSBzZXRfbWVtb3J5X3JlZ2lvbl90ZXN0Cj4gLVRFU1RfR0VOX1BST0dTX3Jpc2N2
ICs9IGt2bV9iaW5hcnlfc3RhdHNfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19yaXNjdiArPSBzdGVh
bF90aW1lCj4KPiAgU1BMSVRfVEVTVFMgKz0gZ2V0LXJlZy1saXN0Cj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IGlu
ZGV4IGRjNTBhZDYyZTE1MC4uYTBmOWVmZTVhMmE4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBAQCAtMTI4
LDYgKzEyOCw3IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgX19rdm1fcmVnX2lkKHVpbnQ2NF90
IHR5cGUsIHVpbnQ2NF90IHN1YnR5cGUsCj4KPiAgZW51bSBzYmlfZXh0X2lkIHsKPiAgICAgICAg
IFNCSV9FWFRfQkFTRSA9IDB4MTAsCj4gKyAgICAgICBTQklfRVhUX1NUQSA9IDB4NTM1NDQxLAo+
ICB9Owo+Cj4gIGVudW0gc2JpX2V4dF9iYXNlX2ZpZCB7Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9zdGVhbF90aW1lLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vc3RlYWxfdGltZS5jCj4gaW5kZXggMTcxYWRmYjJhNmNiLi5iYWUwYzUwMjZmODIgMTAw
NjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3N0ZWFsX3RpbWUuYwo+ICsr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9zdGVhbF90aW1lLmMKPiBAQCAtMTEsNyAr
MTEsOSBAQAo+ICAjaW5jbHVkZSA8cHRocmVhZC5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+Cj4gICNpbmNsdWRlIDxhc20va3ZtLmg+Cj4gKyNpZm5kZWYgX19yaXNjdgo+ICAjaW5jbHVk
ZSA8YXNtL2t2bV9wYXJhLmg+Cj4gKyNlbmRpZgo+Cj4gICNpbmNsdWRlICJ0ZXN0X3V0aWwuaCIK
PiAgI2luY2x1ZGUgImt2bV91dGlsLmgiCj4gQEAgLTIwMyw2ICsyMDUsMTAzIEBAIHN0YXRpYyB2
b2lkIHN0ZWFsX3RpbWVfZHVtcChzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDMyX3QgdmNwdV9pZHgp
Cj4gICAgICAgICBwcl9pbmZvKCIgICAgc3RfdGltZTogJWxkXG4iLCBzdC0+c3RfdGltZSk7Cj4g
IH0KPgo+ICsjZWxpZiBkZWZpbmVkKF9fcmlzY3YpCj4gKwo+ICsvKiBTQkkgU1RBIHNobWVtIG11
c3QgaGF2ZSA2NC1ieXRlIGFsaWdubWVudCAqLwo+ICsjZGVmaW5lIFNURUFMX1RJTUVfU0laRSAg
ICAgICAgICAgICAgICAoKHNpemVvZihzdHJ1Y3Qgc3RhX3N0cnVjdCkgKyA2MykgJiB+NjMpCj4g
Kwo+ICtzdGF0aWMgdm1fcGFkZHJfdCBzdF9ncGFbTlJfVkNQVVNdOwo+ICsKPiArc3RydWN0IHN0
YV9zdHJ1Y3Qgewo+ICsgICAgICAgdWludDMyX3Qgc2VxdWVuY2U7Cj4gKyAgICAgICB1aW50MzJf
dCBmbGFnczsKPiArICAgICAgIHVpbnQ2NF90IHN0ZWFsOwo+ICsgICAgICAgdWludDhfdCBwcmVl
bXB0ZWQ7Cj4gKyAgICAgICB1aW50OF90IHBhZFs0N107Cj4gK30gX19wYWNrZWQ7Cj4gKwo+ICtz
dGF0aWMgdm9pZCBzdGFfc2V0X3NobWVtKHZtX3BhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGZs
YWdzKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGxvID0gKHVuc2lnbmVkIGxvbmcpZ3Bh
Owo+ICsjaWYgX19yaXNjdl94bGVuID09IDMyCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhpID0g
KHVuc2lnbmVkIGxvbmcpKGdwYSA+PiAzMik7Cj4gKyNlbHNlCj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGhpID0gZ3BhID09IC0xID8gLTEgOiAwOwo+ICsjZW5kaWYKPiArICAgICAgIHN0cnVjdCBz
YmlyZXQgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfU1RBLCAwLCBsbywgaGksIGZsYWdzLCAwLCAw
LCAwKTsKPiArCj4gKyAgICAgICBHVUVTVF9BU1NFUlQocmV0LnZhbHVlID09IDAgJiYgcmV0LmVy
cm9yID09IDApOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBjaGVja19zdGF0dXMoc3RydWN0IHN0
YV9zdHJ1Y3QgKnN0KQo+ICt7Cj4gKyAgICAgICBHVUVTVF9BU1NFUlQoIShSRUFEX09OQ0Uoc3Qt
PnNlcXVlbmNlKSAmIDEpKTsKPiArICAgICAgIEdVRVNUX0FTU0VSVChSRUFEX09OQ0Uoc3QtPmZs
YWdzKSA9PSAwKTsKPiArICAgICAgIEdVRVNUX0FTU0VSVChSRUFEX09OQ0Uoc3QtPnByZWVtcHRl
ZCkgPT0gMCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NvZGUoaW50IGNwdSkKPiAr
ewo+ICsgICAgICAgc3RydWN0IHN0YV9zdHJ1Y3QgKnN0ID0gc3RfZ3ZhW2NwdV07Cj4gKyAgICAg
ICB1aW50MzJfdCBzZXF1ZW5jZTsKPiArICAgICAgIGxvbmcgb3V0X3ZhbCA9IDA7Cj4gKyAgICAg
ICBib29sIHByb2JlOwo+ICsKPiArICAgICAgIHByb2JlID0gZ3Vlc3Rfc2JpX3Byb2JlX2V4dGVu
c2lvbihTQklfRVhUX1NUQSwgJm91dF92YWwpOwo+ICsgICAgICAgR1VFU1RfQVNTRVJUKHByb2Jl
ICYmIG91dF92YWwgPT0gMSk7Cj4gKwo+ICsgICAgICAgc3RhX3NldF9zaG1lbShzdF9ncGFbY3B1
XSwgMCk7Cj4gKyAgICAgICBHVUVTVF9TWU5DKDApOwo+ICsKPiArICAgICAgIGNoZWNrX3N0YXR1
cyhzdCk7Cj4gKyAgICAgICBXUklURV9PTkNFKGd1ZXN0X3N0b2xlbl90aW1lW2NwdV0sIHN0LT5z
dGVhbCk7Cj4gKyAgICAgICBzZXF1ZW5jZSA9IFJFQURfT05DRShzdC0+c2VxdWVuY2UpOwo+ICsg
ICAgICAgY2hlY2tfc3RhdHVzKHN0KTsKPiArICAgICAgIEdVRVNUX1NZTkMoMSk7Cj4gKwo+ICsg
ICAgICAgY2hlY2tfc3RhdHVzKHN0KTsKPiArICAgICAgIEdVRVNUX0FTU0VSVChzZXF1ZW5jZSA8
IFJFQURfT05DRShzdC0+c2VxdWVuY2UpKTsKPiArICAgICAgIFdSSVRFX09OQ0UoZ3Vlc3Rfc3Rv
bGVuX3RpbWVbY3B1XSwgc3QtPnN0ZWFsKTsKPiArICAgICAgIGNoZWNrX3N0YXR1cyhzdCk7Cj4g
KyAgICAgICBHVUVTVF9ET05FKCk7Cj4gK30KPiArCj4gK3N0YXRpYyBib29sIGlzX3N0ZWFsX3Rp
bWVfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgdWludDY0
X3QgaWQgPSBSSVNDVl9TQklfRVhUX1JFRyhLVk1fUklTQ1ZfU0JJX0VYVF9TVEEpOwo+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBlbmFibGVkOwo+ICsKPiArICAgICAgIHZjcHVfZ2V0X3JlZyh2Y3B1
LCBpZCwgJmVuYWJsZWQpOwo+ICsgICAgICAgVEVTVF9BU1NFUlQoZW5hYmxlZCA9PSAwIHx8IGVu
YWJsZWQgPT0gMSwgIkV4cGVjdGVkIGJvb2xlYW4gcmVzdWx0Iik7Cj4gKwo+ICsgICAgICAgcmV0
dXJuIGVuYWJsZWQ7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHN0ZWFsX3RpbWVfaW5pdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVpbnQzMl90IGkpCj4gK3sKPiArICAgICAgIC8qIFNUX0dQQV9C
QVNFIGlzIGlkZW50aXR5IG1hcHBlZCAqLwo+ICsgICAgICAgc3RfZ3ZhW2ldID0gKHZvaWQgKiko
U1RfR1BBX0JBU0UgKyBpICogU1RFQUxfVElNRV9TSVpFKTsKPiArICAgICAgIHN0X2dwYVtpXSA9
IGFkZHJfZ3ZhMmdwYSh2Y3B1LT52bSwgKHZtX3ZhZGRyX3Qpc3RfZ3ZhW2ldKTsKPiArICAgICAg
IHN5bmNfZ2xvYmFsX3RvX2d1ZXN0KHZjcHUtPnZtLCBzdF9ndmFbaV0pOwo+ICsgICAgICAgc3lu
Y19nbG9iYWxfdG9fZ3Vlc3QodmNwdS0+dm0sIHN0X2dwYVtpXSk7Cj4gK30KPiArCj4gK3N0YXRp
YyB2b2lkIHN0ZWFsX3RpbWVfZHVtcChzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDMyX3QgdmNwdV9p
ZHgpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzdGFfc3RydWN0ICpzdCA9IGFkZHJfZ3ZhMmh2YSh2
bSwgKHVsb25nKXN0X2d2YVt2Y3B1X2lkeF0pOwo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAg
ICAgcHJfaW5mbygiVkNQVSVkOlxuIiwgdmNwdV9pZHgpOwo+ICsgICAgICAgcHJfaW5mbygiICAg
IHNlcXVlbmNlOiAgJWRcbiIsIHN0LT5zZXF1ZW5jZSk7Cj4gKyAgICAgICBwcl9pbmZvKCIgICAg
ZmxhZ3M6ICAgICAlZFxuIiwgc3QtPmZsYWdzKTsKPiArICAgICAgIHByX2luZm8oIiAgICBzdGVh
bDogICAgICUiUFJJdTY0IlxuIiwgc3QtPnN0ZWFsKTsKPiArICAgICAgIHByX2luZm8oIiAgICBw
cmVlbXB0ZWQ6ICVkXG4iLCBzdC0+cHJlZW1wdGVkKTsKPiArICAgICAgIHByX2luZm8oIiAgICBw
YWQ6ICAgICAgIik7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgNDc7ICsraSkKPiArICAgICAg
ICAgICAgICAgcHJfaW5mbygiJWQiLCBzdC0+cGFkW2ldKTsKPiArICAgICAgIHByX2luZm8oIlxu
Iik7Cj4gK30KPiArCj4gICNlbmRpZgo+Cj4gIHN0YXRpYyB2b2lkICpkb19zdGVhbF90aW1lKHZv
aWQgKmFyZykKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
