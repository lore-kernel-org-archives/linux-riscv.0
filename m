Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0EECA600D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67Ch+zi366TcVgbD2dZq/0NWD/wP3rjhdUM07PvYoaE=; b=Mioqy4k5q0EArF
	Ohbd3P4II2adJx4qV0/qySsZlJfKOOmeBQWZNNYmL19tKUDNThMYhLl6uxo1HeD32A7mF3GaOm23c
	G3Ci2h3x1glR5ZwO9qBrGlN5yCTKm3X7UAfSsUwI8mochsbWk8RvbYVNKtvQNVDhSo/2Ehith6OAr
	TeN6RmaYjG0JyVdqJrJpLGVphZ3oNHr6Jv43gaNNyfDdQ5ZGFJN0PyssgGap64CW+AdKtu5ZncGd6
	kaSzXUpvuTp+n1PbS60PEgeq/ENwxSQsp/tJeW9Y1fJ9fSlcecsM54//bCQvkE4KwnBDrTJ4vcRCn
	Xto2PQEIqyO5xwisW8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoK-00000003RoK-22wd;
	Thu, 08 Oct 2026 03:28:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoH-00000003RmW-0t4I
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hiSC838081
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=; b=LmBibQsmJgrWvl9H
	EAX7LSU6LzffQW5TbuTzVl6YhecF6VnzDqivCZnOdzvSdd8nxdFV70PJ7evULILu
	DH1a17ViZaW+VDl4NmO26j3aWRMiDq1xD8HDEwnrWjz20wfY02fVv7nHhh4pNipH
	fSMtE912PlknDJrTwNreZpkQl7byBxuGBDiyaQrxZFmv3R8Qi6JpKP+toJTTrhNF
	+PiylbhDH6+CuDtfbEYkLMAw6CiuAUVks9vSkY4+S9Zq1X/KKZ3Nl4nOINcUgmfW
	9M+TVk4vA3rJpg7HrUUF3Qu8wQeWom5OhIilw4rei9PYUMxhxJ7Tian9DS8OqbQO
	c7oyIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe50wep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34e676375d9so4889554eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430124; x=1792034924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=kTYp1V2WmR/hG2F0sOVVCwHEWcbJwZFoU+dkqCxfqmirqQ3ohHNZJCQaXwGmNA/f8S
         t4BbINOMnwpXHjZDKFzAfNI0+dI74TdmIwNMJd5TkU9bygoA+1KmN4VqmUL96J2G4Wm4
         VWW39OihZ9DAv6YOG2QdkxXSzFoQhZOz251/i57u6ACzertJzt97q6lr815u89QogyY/
         NpFlEcmOMC1Xbetxh/hU9DImH9YAsdfMaViss06zWNPgQSQntoKQd9xBu6Cx/mzDCoto
         Wx6SmLzX00Rcl38emowNvxc9dWUknulkCfwRLA1bRoe/6Ai8rtP2DpyBEF129MvJCqa5
         3w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430124; x=1792034924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WXFbSFSr1/RQ2vXdoBOENE9gIt1QGKOfRFfzDrKe+A=;
        b=b3lPgcppUvg4H2zAf7DIQrcfCw7gHwivYYUDbMEXEYuaQ1eQuhb+BiLasU82oOh5e+
         /nxP00Fmpim7KLV6gNdu5ucO4B4D5eNNl0iGFhQnYejIswqInZFCxzaupq9FK+b+li+5
         DHyw5p3V3B1dTuev1bxM/2xaN6lEVCGQXOC4DpyIK4y1isFscAFPyB3zU4sw6x5Le6X0
         Fl1piLlimqLnO1dMeL6M9Zmoz+HlI5Fqric1NKhFu39s1ootgKKU/8TwYe3BTIoJcMRR
         X77Hl92hFTQ1tlxbTCzcR80AG7DLxb0gZKhUC05kpd0uyHhy+hOpCZcKLxQw8jxv46Sb
         Pczw==
X-Forwarded-Encrypted: i=1; AKwUvBwfp+4nTL3ycMbp5RNPLCwgihC327a35pI8Z2WtOTfKOguw7XTnfKQgI6duXu56PhvGsLpyUDcNNWPduw==@lists.infradead.org
X-Gm-Message-State: AFuF++lV/YydoBamRtt0t4MeNdcJvCPXK2z4r0odo0IiHyU+XgShpqbK
	H1jBjMsXSwgFLcRbp9kHO5d9XEs1qX80F3wa9fQBKmfEWsAxvHq/CLPVip/SuiQiCk1L492ydfN
	Hc/G5w+isP6XoP/v+52Lo5Eya1wWIENqPt98SstDS5KT3sBHRpMwfqddByLkp5Gnoh/vfQA==
X-Gm-Gg: AYBFou2p3LDSH4lri/VS3lpXVWZqwP6NzcKJG+lu5pYcaLEFlXljq1l4H/I4eY7zAf/
	UvzuvjRA33YN4GkXOKkRb7pukVZwu9i+/fZ13vqN8Mx8YHm97a4pW/6NFY14OjhItb0XL1wepPz
	Pt1LYdhzxPu/cyOkChAwWPUbl1ux9fpB55AmVd6DTvFBts/wHfjLDjXUyi7wMwiXtj9Ut+Yqd7r
	GsAz1GStyORZsBOZl7VnMum9nvh3GpovMuKTWkc87Irh2ppgZxxaZXU4nziToXmQYvR9mkxvfsR
	++VQGqyKQsZC5WIHSJMq7hgAh2etGWoCsvM+K3h/ixD5PZ0TC8YdyxSlNzcsEu2B0aMdH8/sQmj
	k0EhCaz8gIRNCbo/XkkFF701qaOixmh0KWOlTHbjF1IxJ4vQucwmwADxhmw==
X-Received: by 2002:a05:7300:ff4c:b0:348:201a:6c88 with SMTP id 5a478bee46e88-351777524c7mr1305540eec.13.1791430123759;
        Wed, 07 Oct 2026 20:28:43 -0700 (PDT)
X-Received: by 2002:a05:7300:ff4c:b0:348:201a:6c88 with SMTP id 5a478bee46e88-351777524c7mr1305518eec.13.1791430123105;
        Wed, 07 Oct 2026 20:28:43 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:08 -0700
Subject: [PATCH RFC v2 02/10] mailbox: mpxy: add direct synchronous send
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-2-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: 78DVPoKvMfpXiEOMYVGA8zaQnKxELsZK
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac70dec cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Tu2Rjsi-ZZ_FYV3k_IYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX0+lR0jG3B/Rd
 2oYjX1A/FOwxvAMjrkCVAT44koOwRlWEonOENF/wn4j45QO4QKyVLo6Zy33ngKCHCRgsOqulkDC
 99uhA1vD+WjOZ36/3rjG7tGdlOMaLds=
X-Proofpoint-GUID: 78DVPoKvMfpXiEOMYVGA8zaQnKxELsZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX2+HHUZSWzsuG
 Za72ZgkbqnPBiUGodG5Jm7sZj37wdsAkA2u+wTReed5uO7ECLl4M6wWFsd1Q9u3Rk+vl+Dk6xB5
 nBsfyPRIuOqe5j5fMm6W1jjmbtKZdCr59OFyTOM/YOvhObtIVdy6QL2uvEAq8KeTnAROq+rTOew
 vnjuoLHcPGWx2FalKssN6QY39xeRxKvWxnAwRRvE3FlQonbcmVlok6BLHha9+yXIwJ7uyL1aDrX
 TZqOXmJTUFYnr14js2aQvX1veBo/VHpuXtr0HFfn72sOO+UrHT8n1JaatlwsiwCKKOE10HisYAX
 KThx36NuP/vf3HeuZhBIONygcnjEKrf0dEX7TVQoIRE0TwAC6vJGpHW0jGZ7/NtAEAAANkdUw7V
 RYe+8HIGA0+MSsx+0EsdrZMfdjJnKGavNYOITv4UDW0GYAxSlbmW7xViA66FKd+xv8Fw5dumtZK
 X8kTpFNZ/Put9cSMKKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202845_267725_C339E2CD 
X-CRM114-Status: GOOD (  18.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Implement send_data_sync() for RPMI MPXY channels, reusing the
existing RPMI message dispatch and returning its status directly
instead of going through mbox_chan_txdone().

Factor per-hart shared-memory acquisition into mpxy_shmem_get()/
mpxy_shmem_put() so both the queued and the new synchronous path pin
the CPU around the same per-hart buffer, keeping a request and its
response on one hart. Calls on separate harts remain independent,
subject to firmware support.

Add rpmi_mbox_send_message_sync() as the RPMI counterpart to
rpmi_mbox_send_message(), for use by the upcoming TEE transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c      | 196 ++++++++++++++++++-----------
 include/linux/mailbox/riscv-rpmi-message.h |  13 ++
 2 files changed, 139 insertions(+), 70 deletions(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..5ca1b6d87f5c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -125,54 +125,83 @@ static DEFINE_PER_CPU(struct mpxy_local, mpxy_local);
 static unsigned long mpxy_shmem_size;
 static bool mpxy_shmem_init_done;
 
+static int mpxy_shmem_get(struct mpxy_local **out)
+{
+	struct mpxy_local *mpxy;
+
+	get_cpu();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active) {
+		put_cpu();
+		return -ENODEV;
+	}
+
+	*out = mpxy;
+	return 0;
+}
+
+static void mpxy_shmem_put(void)
+{
+	put_cpu();
+}
+
 static int mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct mpxy_local *mpxy;
+	struct sbi_mpxy_channel_ids_data *sdata;
 	u32 remaining, returned, count, start_index = 0;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
-		if (sret.error)
-			goto err_put_cpu;
+		if (sret.error) {
+			rc = sbi_err_map_linux_errno(sret.error);
+			goto out;
+		}
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
@@ -182,55 +211,61 @@ static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
 		start_index += count;
 	} while (remaining && start_index < channel_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			   u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
+	rc = 0;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			    u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
+	mpxy_shmem_put();
 	return sbi_err_map_linux_errno(sret.error);
 }
 
@@ -239,16 +274,17 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				       void *rx, unsigned long max_rx_len,
 				       unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -259,8 +295,8 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
 		if (rx_bytes > max_rx_len) {
-			put_cpu();
-			return -ENOSPC;
+			rc = -ENOSPC;
+			goto out;
 		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
@@ -268,22 +304,25 @@ static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 					  void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -292,40 +331,45 @@ static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_notifications(u32 channel_id,
 				  struct sbi_mpxy_notification_data *notif_data,
 				  unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
+	int rc;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	rc = mpxy_shmem_get(&mpxy);
+	if (rc)
+		return rc;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
-	if (sret.error)
-		goto err_put_cpu;
+	if (sret.error) {
+		rc = sbi_err_map_linux_errno(sret.error);
+		goto out;
+	}
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
 	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
-		return -EOVERFLOW;
+		rc = -EOVERFLOW;
+		goto out;
 	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	rc = sbi_err_map_linux_errno(sret.error);
+out:
+	mpxy_shmem_put();
+	return rc;
 }
 
 static int mpxy_get_shmem_size(unsigned long *shmem_size)
@@ -402,8 +446,8 @@ struct mpxy_mbox {
 
 /* ====== MPXY RPMI processing ====== */
 
-static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
-				     struct rpmi_mbox_message *msg)
+static int mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
+				    struct rpmi_mbox_message *msg)
 {
 	msg->error = 0;
 	switch (msg->type) {
@@ -474,6 +518,8 @@ static void mpxy_mbox_send_rpmi_data(struct mpxy_mbox_channel *mchan,
 		msg->error = -EOPNOTSUPP;
 		break;
 	}
+
+	return msg->error;
 }
 
 static void mpxy_mbox_peek_rpmi_data(struct mbox_chan *chan,
@@ -516,12 +562,21 @@ static int mpxy_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct mpxy_mbox_channel *mchan = chan->con_priv;
 
-	if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
-		mpxy_mbox_send_rpmi_data(mchan, data);
-		return 0;
-	}
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
+
+	mpxy_mbox_send_rpmi_data(mchan, data);
+	return 0;
+}
+
+static int mpxy_mbox_send_data_sync(struct mbox_chan *chan, void *data)
+{
+	struct mpxy_mbox_channel *mchan = chan->con_priv;
+
+	if (mchan->attrs.msg_proto_id != SBI_MPXY_MSGPROTO_RPMI_ID)
+		return -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	return mpxy_mbox_send_rpmi_data(mchan, data);
 }
 
 static bool mpxy_mbox_peek_data(struct mbox_chan *chan)
@@ -713,10 +768,11 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }
 
 static const struct mbox_chan_ops mpxy_mbox_ops = {
-	.send_data = mpxy_mbox_send_data,
-	.peek_data = mpxy_mbox_peek_data,
-	.startup = mpxy_mbox_startup,
-	.shutdown = mpxy_mbox_shutdown,
+	.send_data	= mpxy_mbox_send_data,
+	.send_data_sync	= mpxy_mbox_send_data_sync,
+	.peek_data	= mpxy_mbox_peek_data,
+	.startup	= mpxy_mbox_startup,
+	.shutdown	= mpxy_mbox_shutdown,
 };
 
 /* ====== MPXY platform driver ===== */
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index d5362b5821f9..16fa85f65d80 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -251,4 +251,17 @@ static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
 	return ret;
 }
 
+static inline int rpmi_mbox_send_message_sync(struct mbox_chan *chan,
+					      struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel synchronously */
+	ret = mbox_send_message_sync(chan, msg);
+	if (ret)
+		return ret;
+
+	return msg->error;
+}
+
 #endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
