Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB8DCA601F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kR6Asf7P3bN1m7Rx4kAB0crht9C+zB4d17xkpxBhSAE=; b=3S5Ihv0PQbk5kq
	dkEQPmWhJxIHmjoJEuX9EZfEpDtL62gfxCLyoVLyN9QAf5Yd/CilAZ0XcvInYBkj7HJaobcxJE5+i
	jpPVA5Jd30hlyHKu8euvArcUEvRiC6mZP5HJiJqA/h521wQ5D9x9HINElAck93fLa9bZSbrjceeme
	3oacsD5quEjpbs8APG2kfk2SuM4l5N15hmFI32vEBacBuo7CwnscEakL+ZL2n4fxeVi8zuZq/LMz7
	jo1coUeZONwy1mnGNeG35cj/JspY/fsn9C9MC1MjCQvbWCCX5NfLn5sMwcmpyW2yVJ5vkxSyeGho5
	YnxZMY4+d+i73nBcQfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGe5-000000078Or-3Erl;
	Fri, 09 Oct 2026 19:52:45 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGe3-000000078O6-2M6U
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 19:52:44 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcbb82dbadso10433e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 12:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791575561; cv=none;
        d=google.com; s=arc-20260327;
        b=NRylFLcWIgIaEXVVkuzX7d2LwKX/Tw3ATEnLtfR+RdylbBdWV3OYcitciVvBl++H4r
         K7tn+rt9tHCc7Xxch60y4AxlD3xdwJcI4zr0ZyzI/S4/Y8JfOfd5PF65RisMVUIWzwWT
         3l7nxi2Q+up5tTc4qRKtICKluSsC++DIFhYbF6f1i1ddX0J7zs7QgQe4v9fcT7FJvvWC
         w9kEbfRMF5U+WWmZFKX+3vz0ZSz/v5ol4C25DmYBes2YuPL/Snk4I/JhBx4inVPgA/Bz
         iGnZCIlgIn13NAnMoY2ThlaShDwqHN743TYELjwvW0Y+royM+UyXDam/LwmUfIZAYajI
         YJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        fh=JLRgUtLscU5YlVpk5p4M90NWHQ9gLx5bda9vlXJb/8I=;
        b=nrJO0WkpgMTOkOYI9FIDsXWyrfMsSkW/yiq1s+2azL0gs5D8TxK7uHp0idPANy0+mi
         FxukJAB9t787suMfM24HY/szwOMTrzqxwugQnFOAo5ghXqTR9QCNJ5dQ6ffpMqTHFkzS
         G+WgVsHaX5EclZTf+0nUE+6UklnKG+yKnG9MSEUGs6HEr1X8cNbkNcKqbHR8pIrNjcFV
         7evKepSAKR6vhqz/dSKMYBRvnRXYcUwCoZM/hj4Jx3CfsjU4ZBwm452lyXa9L+MzTOWJ
         8xrq15RH+PGa/jHmE+M0iVT020DCaRnt9ZfldXsvobMoHMGJzHFJ64VZ2yXWr5eGDwLA
         crGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791575561; x=1792180361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=QM/i9wISKop65N247GJmO/NFwBk6StEBU+JYZCmauo6YcXODTj/b8OHbl62R8IrbY3
         VpijuSb1xrrjAe5feZAyoV9SWG088HONSBL64JM7dvx8wdgUA9/B+j4ukeGhANXQdhFW
         NfKCb3XROopaSu6e8A2An/CCU4LPyoJ+uIY1NmPMvd6YJ0S3d9Di4K5ho8KxFG8ZHMSd
         F9vxIydrpkFfgmo8GQJMDj2kv7hQqktI2IqWsWSXDXnZ0xcCOINAQhIAkw4h/mkIelds
         O6YnITdyiHGg22EF3GktO9A3d1dAUH5JJDdHNtoW1KPHX3MNO7adjsAkGeOV+/rXaiuh
         spRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575561; x=1792180361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8IOkLqKGpOfZvqZ//aJaXg6rNYWnLDF+R3NnxinhKE=;
        b=xO7CStfHtkv41+kBhaxNx82tZ+YSB8CYXfXogVTDYxPO4j73WQrWjh718JDk/dt9Vj
         KvklTHPQHgII6zACA3qm/aPJrMZzj2d0QIzDE7mK4CHsDFYfon+7T4ZkC1pXKdXfyLu8
         i369HpuLhBV0yYzx85q2epBvKIfu4zF87p8yvCqq28ca8I5uWbbdGoUdKlkZ2McMPagP
         nVtW/oOs1YR7UK/sTDdRNozpGyvQ6cNdcYmKn6fMUnPJojCHhp7N179eOmwCM/rcMgs9
         qccQevaiW3ctRcOPxE1dUdx55gIytSajQx9mWzXdIh8BCbWiCZ7ovRtcvAQNiaO/3IcM
         kLFA==
X-Forwarded-Encrypted: i=1; AKwUvBzp3UgzPY2JfjGlTUzBZdRn8pYCT5ll0cBjZf2W9lr27kKTGnxcJC+XESOO1dh2m+pz43quATBiyDfUFA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLO7ZOgbHJ2IvsHgU2VmdvtPgWP9AIoge2mNjLes4axm3uW4WR2
	r9VJ1NSxIBo4pwSdhYrtsr/Ju2QwwC/pm/Zvz7zFT/Lsn9gRHI4cVHQOhtbM1KQzGkyc5uu9pz3
	2b++fycjTOqYxxwwRwur7Fw5/SakIKk/KK7ShlgUrQw==
X-Gm-Gg: AYBFou2UyfWryHQXfWCml9rjyf6RHVcw+1e+9PPP7WD/z6t4gRCNlVoHvGh6NWGbV1W
	XlHll4lZ5XbSpSuqxkT1SXw1VbH2o3Ji33NqbivCvYlRvQ0W3lTZxb1kLUFJUBp3c0Ah2wtU1Bl
	alwVH60IKfaa+4hRTk3RbylLFuHbZMZrGoldI14BRhhPsApbGR1MnJ5t27oXxEXpBeizT+p0NWY
	5DJNy1hLJlSWkO1PCh5IoC4tcNXhl5U+1vNxH/MBkePvkKSqG3xbVxXpL2Ve2D7ksV/3zvJTKWu
	u2fS3ZN/76r7RgOTzQs19xiWEcg8Y/6eOOfCZKxdynTGkreLJBIIzaIeAWO4HQmUayNifRQO6Tm
	V/iOn5ijyXqlKj5jTsyyAjsFo0nBh/jjGBhl8qZqGtHZTDTBRIQRU4LmRrPVN3+FLMY4MA0zoCg
	==
X-Received: by 2002:a05:6512:6c4:b0:5ba:3888:7055 with SMTP id
 2adb3069b0e04-5bcde8d8587mr987668e87.48.1791575560885; Fri, 09 Oct 2026
 12:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
In-Reply-To: <20260917122012.2577-1-yuanxiaofeng@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 21:52:29 +0200
X-Gm-Features: AclHuK9LE_K8n8SBL5vcZdIBUie1cZWxyC_Q9G86b62TjkF_wne6tghiR0d8MC4
Message-ID: <CAAhSdy0CWoLshP7GyONS2E-wYOZF8hEjbBosOnc74LvtjkUbDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_125243_625391_7E04E78C 
X-CRM114-Status: GOOD (  21.12  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMjoyMOKAr1BNIFhpYW9mZW5nIFl1YW4KPHl1YW54aWFv
ZmVuZ0Blc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBJUEkgaGFuZGxlciB3
YWxrcyB2Q1BVcyB3aXRoIGt2bV9mb3JfZWFjaF92Y3B1KCksIHdoaWNoCj4gaXRlcmF0ZXMgYnkg
dmNwdV9pZHggKGNyZWF0aW9uIG9yZGVyKSByYXRoZXIgdGhhbiB2Y3B1X2lkIG9yZGVyLgo+IFNp
bmNlIHZjcHVfaWQgY2FuIGJlIGFzc2lnbmVkIG91dCBvZiBvcmRlciBieSB1c2Vyc3BhY2UsIGEg
dkNQVSB3aG9zZQo+IGhhcnRfYml0IGZhbGxzIG91dHNpZGUgdGhlIFhMRU4tYml0IGhhcnRfbWFz
ayByYW5nZSBtYXkgYmUgcmVhY2hlZAo+IGJlZm9yZSB2Q1BVcyB0aGUgbWFzayBhY3R1YWxseSB0
YXJnZXRzLiBJbiB0aGF0IGNhc2UgdGhlIGhhbmRsZXIganVtcHMKPiB0byAiZG9uZSIgYW5kIHN0
b3BzIHNlbmRpbmcgSVBJcywgbGVhdmluZyB2YWxpZCB0YXJnZXQgdkNQVXMgd2l0aG91dAo+IGFu
IGludGVycnVwdC4KPgo+IFJlcGxhY2UgdGhlIGVhcmx5ICJnb3RvIGRvbmUiIHdpdGggImNvbnRp
bnVlIiBzbyB2Q1BVcyBvdXRzaWRlIHRoZQo+IGhhcnRfbWFzayByYW5nZSBhcmUgc2tpcHBlZCB3
aXRob3V0IGFib3J0aW5nIHRoZSBsb29wLgo+Cj4gUmVwcm9kdWNlZCB3aXRoIGEgbWluaW1hbCB1
c2Vyc3BhY2UgVk1NIGRyaXZpbmcgS1ZNIGluc2lkZSBhIFFFTVUKPiAoUklTQy1WIHZpcnQpIGd1
ZXN0OiB0aHJlZSB2Q1BVcyBhcmUgY3JlYXRlZCB3aXRoIGlkcyAxMDAsIDAsIDEgKGluCj4gY3Jl
YXRpb24gb3JkZXIpIGFuZCBzYmlfc2VuZF9pcGkoaGFydF9tYXNrPWJpdDAsIGhiYXNlPTApIGlz
IGNhbGxlZAo+IGZyb20gdmNwdV9pZCAxLiBCZWZvcmUgdGhpcyBjaGFuZ2UgdGhlIElQSSBpcyBk
cm9wcGVkIGFuZCB0aGUgZWNhbGwKPiByZXR1cm5zIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsgd2l0
aCB0aGlzIGNoYW5nZSB0aGUgSVBJIGlzIGRlbGl2ZXJlZAo+IGFuZCB0aGUgZWNhbGwgcmV0dXJu
cyBTQklfU1VDQ0VTUy4KPgo+IEZpeGVzOiAwNjExZjc4ZjgzYzkgKCJyaXNjdjogS1ZNOiBGaXgg
U0JJIElQSSBlcnJvciBnZW5lcmF0aW9uIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFN1Z2dlc3RlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBYaWFvZmVuZyBZdWFuIDx5dWFueGlhb2ZlbmdAZXN3aW5jb21wdXRpbmcu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuNAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9yZXBsYWNlLmMgfCAxMiArKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gaW5kZXggNTA2YTUxMGI2Li5jMmYxZjdmMjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCj4gQEAgLTY0LDggKzY0LDE3IEBAIHN0YXRpYyBp
bnQga3ZtX3NiaV9leHRfaXBpX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qg
a3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0bXAtPnZjcHVfaWQg
PCBoYmFzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGhhcnRfYml0ID0gdG1wLT52Y3B1X2lkIC0gaGJhc2U7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBr
dm1fZm9yX2VhY2hfdmNwdSgpIHdhbGtzIGt2bS0+dmNwdXNbXSBieQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIHZjcHVfaWR4LCBpLmUuIHRoZSBjcmVhdGlvbiBvcmRlciwgd2hpY2ggaGFz
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogbm90aGluZyB0byBkbyB3aXRoIHRoZSB2Y3B1
X2lkIChoYXJ0IGlkKSBzcGFjZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoYXQgdGhl
IFNCSSBJUEkgb3BlcmF0ZXMgb24uIHZjcHVfaWRzIG5lZWQgbm90Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogaW5jcmVhc2UgYWxvbmcgdGhlIGl0ZXJhdGlvbiwgc28gaGFydHMgb3V0c2lk
ZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoZSBoYXJ0X21hc2sgd2luZG93IG11c3Qg
YmUgc2tpcHBlZCBpbnN0ZWFkIG9mCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogYWJvcnRp
bmcgdGhlIGxvb3AuCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKGhhcnRfYml0ID49IF9fcmlzY3ZfeGxlbikKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghKGhtYXNrICYg
KDFVTCA8PCBoYXJ0X2JpdCkpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gICAgICAgICAgICAgICAgIH0KPiBAQCAtNzYsNyArODUsNiBAQCBzdGF0aWMgaW50
IGt2bV9zYmlfZXh0X2lwaV9oYW5kbGVyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZnco
dG1wLCBTQklfUE1VX0ZXX0lQSV9SQ1ZEKTsKPiAgICAgICAgIH0KPgo+IC1kb25lOgo+ICAgICAg
ICAgaWYgKGhiYXNlICE9IC0xVUwgJiYgKGhtYXNrIF4gc2VudG1hc2spKQo+ICAgICAgICAgICAg
ICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+Cj4gLS0KPiAy
LjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
